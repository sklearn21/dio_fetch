import 'package:dio/dio.dart';
import '../services/http_setup.dart';

class SujitCreateUser {
  HttpService http = HttpService();

  createUser() async {
    Response response;

    try {
      response = await http.postRequest(
        endPoint: 'Login/Login',
        data: {
          "UserDetails": {"UserName": "ppita2", "Password": "pass12345"}
        },
      );

      if (response.statusCode == 201) {
        print(response);
        return response;
      } else {
        print('there was some error with request');
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
