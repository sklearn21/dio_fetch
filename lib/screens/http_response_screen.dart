import 'package:dio_fetch/services/createUser.dart';
import '../services/suzi_get_auth.dart';
import 'package:dio_fetch/services/http_setup.dart';
import 'package:flutter/material.dart';
import '../services/getListUsers.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  _ResponseScreenState createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  void getmyToken() async {
    // GetListUsers myUserList = GetListUsers();
    //await myUserList.getListUsers();

    // HttpService httpService = HttpService();
    // CreateUser createUser = CreateUser();
    // await createUser.createUser();

    SujitCreateUser createUser = SujitCreateUser();
    await createUser.createUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: Text('Post'),
              onPressed: () {
                print('Post called');
                getmyToken();
              },
            ),
          )
        ],
      ),
    );
  }
}
