import 'package:dio/dio.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  TokenInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to unauthorized access
    if (err.response?.statusCode == 401) {
      // Token is in the cookies
      final result = await Networking.post("/resume-access-token", {});
      switch (result) {
        case Success(:final value):
          final accessToken = value.data['data']['access_token'];
          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
          return handler.resolve(await _dio.fetch(err.requestOptions));
        default:
          return handler.reject(err);
      }
    }

    return handler.reject(err);
  }
}
