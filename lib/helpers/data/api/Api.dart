import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../constants/Globals.dart';

class Api {
  
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: Globals.URL));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Globals.URL,
      receiveTimeout: 100000.milliseconds, // 50 seconds
      connectTimeout: 100000.milliseconds,
      sendTimeout: 100000.milliseconds,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  int apiCallCount = 0;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = Globals.authToken;

    apiCallCount++;

    if (accessToken != "") {
      options.headers['Authorization'] = 'Bearer $accessToken';
      // print('Bearer $accessToken');
      log("Api Call Count : ${apiCallCount}");
    } else {
      log("Api Call without token : ${apiCallCount}");
    }

    options.validateStatus = (status) => true;
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  }
}
