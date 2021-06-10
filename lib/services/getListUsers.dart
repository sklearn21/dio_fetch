import 'package:dio/dio.dart';
import './http_setup.dart';

class GetListUsers {
  HttpService http = HttpService();

  getListUsers() async {
    Response response;
    try {
      response = await http.getRequest(endPoint: 'users?page=2');
      if (response.statusCode == 200) {
        print(response);
        return response;
      } else {
        print('there was some error with request');
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
