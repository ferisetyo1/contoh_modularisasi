import 'dart:io';

import 'package:contoh_modularisasi/router/router.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class MainModule {
  @lazySingleton
  Box<dynamic> hiveBox() => Hive.box(HiveBoxName.boxModularisasi);

  @lazySingleton
  AppRouters get appRouters;

  @lazySingleton
  Alice alice(AppRouters routers) => Alice(
      showNotification: false,
      showInspectorOnShake: false,
      navigatorKey: routers.navigatorKey);

  @preResolve
  @lazySingleton
  Future<Dio> dio(Alice alice, HiveHelper hiveHelper) async {
    Dio dio = Dio();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? userAgent;

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      userAgent = iosInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      userAgent = androidInfo.model;
    }
    dio.options = BaseOptions(
        baseUrl: AppConfig.baseUrlApi,
        connectTimeout: AppConfig.longTimeOutMilliSecond,
        receiveTimeout: AppConfig.longTimeOutMilliSecond,
        sendTimeout: AppConfig.longTimeOutMilliSecond,
        headers: {
          'User-Agent': userAgent,
          'Accept': 'application/json',
        });
    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      options.headers["X-ACCESS-KEY"] = AppConfig.clientId;

      // if (options.data is FormData) {
      //   options
      //     ..connectTimeout = Config.longTimeOutMilliSecond
      //     ..receiveTimeout = Config.longTimeOutMilliSecond
      //     ..sendTimeout = Config.longTimeOutMilliSecond;
      // }

      // var currentToken = hiveHelper.getUserToken();
      // var currentRefreshToken = hiveHelper.getRefreshToken();

      switch (options.path) {
        // case "sports":
        //   await Future.delayed(const Duration(milliseconds: 500));
        //   return handler.resolve(
        //       Response(
        //           data: dummySport, requestOptions: options, statusCode: 200),
        //       true);
        default:
      }

      // if (!hiveHelper.getIsLoggedIn()) {
      //   return handler.next(options);
      // }

      // if (currentToken == null) {
      //   return handler.next(options);
      // }

      // bool token = isTokenExpired(currentToken);

      // if (token) {
      //   if (currentRefreshToken != null) {
      //     return await _refreshToken(currentToken, currentRefreshToken,
      //         hiveHelper, options, handler, alice);
      //   }
      // } else {
      //   options.headers["Authorization"] = "Bearer $currentToken";
      // }
      handler.next(options);
    }, onError: (err, handler) async {
      AppConfig.logger.e("=====ERROR=====");
      AppConfig.logger.e("URL : ${err.requestOptions.uri}");
      AppConfig.logger.e("CAUSES : ${err.message}, status : ${err.error}");
      AppConfig.logger.e("=====ERROR=====");

      handler.reject(err);
    }));
    return dio;
  }

  // Future<void> _refreshToken(
  //     String currentToken,
  //     String currentRefreshToken,
  //     HiveHelper hiveHelper,
  //     RequestOptions options,
  //     RequestInterceptorHandler handler,
  //     Alice alice) async {
  //   try {
  //     final dio = Dio();
  //     dio.interceptors.add(alice.getDioInterceptor());
  //     final response = await dio.post("${Config.baseUrlApi}refresh-token",
  //         data: FormData.fromMap({"refresh_token": currentRefreshToken}),
  //         options: Options(method: "POST", headers: {
  //           'client-id': Config.clientId,
  //           "Authorization": "Bearer $currentToken"
  //         }));
  //     if (response.statusCode == 200) {
  //       final result = BaseResponse.fromJson(response.data as dynamic,
  //           (json) => LoginResponse.fromJson(json as dynamic));
  //       hiveHelper.setUserToken(result.data?.accessToken ?? "");
  //       hiveHelper.setRefreshToken(result.data?.refreshToken ?? "");
  //       options.headers["Authorization"] =
  //           "Bearer ${result.data?.accessToken ?? ""}";
  //       handler.next(options);
  //     } else {
  //       handler.next(options);
  //     }
  //   } on DioError catch (e) {
  //     handler.next(options);
  //     debugPrint(e.message);
  //   } catch (e) {
  //     handler.next(options);
  //   }
  // }
}

// bool isTokenExpired(String token) {
//   DateTime? expiryDate = Jwt.getExpiryDate(token)?.toLocal();
//   bool isExpired =
//       DateTime.now().toLocal().isAfter(expiryDate ?? DateTime.now());
//   // debugPrint(
//   //     "isExpired $isExpired ${expiryDate?.compareTo(DateTime.now().toLocal())} $expiryDate");
//   return isExpired;

// }
