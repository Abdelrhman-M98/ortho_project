import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:ortho/shared/networking/request_method.dart';
import 'package:ortho/shared/networking/results.dart';
import 'package:ortho/shared/networking/token_interceptor.dart';
import 'package:path_provider/path_provider.dart';

/// A singleton class for handling network requests using Dio.
class Networking {
  static Networking? _self;

  // ignore: constant_identifier_names
  static const String BASE_URL = "http://13.38.118.46:3000";

  static BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final _dio = Dio(options);

  /// Private constructor for singleton pattern.
  Networking._() {
    _self = this;
  }

  /// Gets the singleton instance of the [Networking] class.
  static Future<Networking> _instance() async {
    if (_self != null) return _self!;
    final instance = Networking._();
    await instance._prepareJar();
    _self = instance;

    return _self!;
  }

  /// Initializes a cookie jar for managing cookies during network requests.
  Future<void> _prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    _dio.interceptors
      ..add(CookieManager(jar))
      ..add(TokenInterceptor(_dio));
  }

  /// Delete all cookies
  static Future<void> deleteCookies() async {
    if (_self == null) return;
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;

    final jar = PersistCookieJar(
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    await jar.deleteAll();
  }

  /// Makes a generic HTTP request with the specified [url], [requestMethod], and optional [data].
  ///
  /// Returns a [Result] containing either a [Response] on success or an [Exception] on failure.
  static Future<Result<Response<T>, DioException, Exception>> call<T>(
      url, RequestMethod requestMethod,
      {dynamic data, String? baseUrl, Map<String, dynamic>? header}) async {
    try {
      final instance = await _instance();
      final Response<T> response = await instance._dio.fetch(
        RequestOptions(
            baseUrl: baseUrl != null ? baseUrl + url : BASE_URL + url,
            method: "$requestMethod",
            data: data,
            headers: header),
      );
      return Success(response);
    } on SocketException catch (e) {
      return Error(Exception(e));
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  /// Makes a POST request with the specified [url] and [data].
  static Future<Result<Response<T>, DioException, Exception>> post<T>(
      String url, dynamic data) async {
    return call(url, RequestMethod.POST, data: data);
  }

  /// Makes a GET request with the specified [url] and optional [data].
  static Future<Result<Response<T>, DioException, Exception>> get<T>(
      String url, Map map,
      {dynamic data}) async {
    return call(url, RequestMethod.GET, data: data);
  }

  /// Makes a DELETE request with the specified [url] and optional [data].
  static Future<Result<Response<T>, DioException, Exception>> delete<T>(
      String url,
      {dynamic data}) async {
    return call(url, RequestMethod.DELETE, data: data);
  }

  /// Makes a PATCH request with the specified [url] and optional [data].
  static Future<Result<Response<T>, DioException, Exception>> patch<T>(
      String url,
      {dynamic data}) async {
    return call(url, RequestMethod.PATCH, data: data);
  }
}
