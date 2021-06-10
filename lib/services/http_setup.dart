import 'package:dio/dio.dart';

class HttpService {
  Dio _dio = Dio();

  HttpService() {
    _dio.options = BaseOptions(
      // baseUrl: 'https://reqres.in/api/',
      baseUrl: 'https://web.portall.in/diabosmobapi/api/',
      connectTimeout: 25000,
      contentType: 'application/json',
      receiveTimeout: 25000,
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          print('Interceptor message:');
          print('method: ${options.method}  URL: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Do something with response data
          print("Interceptor message: Successful");
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          print('Interceptor Error');
          return handler.next(e); //continue
        },
      ),
    );
  }

  Future<Response> getRequest({required String endPoint}) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, required dynamic data}) async {
    Response response;

    try {
      response = await _dio.post(endPoint, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }
}
