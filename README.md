# Ortho AI

Ortho AI is a revolutionary app that utilizes artificial intelligence models to analyze your dental health based on your selfie. Simply take a selfie, and let Ortho AI identify your teeth and any associated issues according to the standards of the perfect smile. Get instant feedback on your dental health right at your fingertips

## Installation
If you'd prefer to skip the build process and download a pre-built version, then this information will be helpful: Preteeth apk supports the following architectures

- 🛠 [armeabi-v7a](https://github.com/Abdelrhman-M98/ortho_project/releases/latest/download/app-armeabi-v7a-release.apk)
- 📦 [arm64-v8a](https://github.com/Abdelrhman-M98/ortho_project/releases/latest/download/app-arm64-v8a-release.apk)
- 🐳 [armeabi-v7a/arm64-v8a](https://github.com/Abdelrhman-M98/ortho_project/releases/latest/download/app-release.apk)

<div align="center">

  # [Download](https://github.com/Abdelrhman-M98/ortho_project/releases/latest/download/app-release.apk)
  <br />
</div>

## Prerequisites

Before using the Ortho AI , please ensure that you meet the following prerequisites:

1. install [Flutter version](https://docs.flutter.dev/release/archive?tab=windows) `3.3.4`
2. insall [Dart Version](https://dart.dev/get-dart)`3.19.6`
3. make Sure your mini Sdk is `21`
4. install [Ortho backend](https://github.com/9init/ortho-backend?tab=readme-ov-file) and make sure the port is exposed.

## Set Environment Variables
**(SUPER IMPORTANT!)** Make sure that you installed [Ortho backend](https://github.com/9init/ortho-backend?tab=readme-ov-file). 

To customize the base URL used in network requests and replace the default IP address with your own, follow these steps:

1. Open the `lib/shared/networking/networking.dart` file in your project.

2. Locate the following line:
   ```dart
   static const String BASE_URL = "http://13.38.118.46:3000";
   ```
3. Replace "http://13.38.118.46:3000" with your desired base URL. For example:
    ```dart
    static const String BASE_URL = "http://your_ip_address:port";
    ```
3. Save the file.

## Building
1. Run this builder script to generate the Data Classes:
    ```bash
    flutter pub run build_runner build
    ```
2. Build the APKs using this command:
    ```bash
    flutter build apk
    ```
3. locate the generated apk and enjoy our product.

## Features

- Create a separate account for each user 👥
- A simple user interface suitable for everyone 📱 
- Ensure that any image taken by the user for analysis is suitable for use before scanning 📷
- Show a report for each photo taken and the ID of each photo to facilitate getting it later 🔢
