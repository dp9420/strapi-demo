import 'package:dio/dio.dart';

class DioClient {
  static const BASE_DEV_URL = "https://10.49.120.105:1337";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_DEV_URL,
    connectTimeout: 30000,
    receiveTimeout: 20000,
  );
  static final DioClient _dioClient = DioClient._internal();
  Dio _dio = new Dio(baseOptions);
  Dio get dio => _dio;
  factory DioClient() {
    return _dioClient;
  }
  DioClient._internal() {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
