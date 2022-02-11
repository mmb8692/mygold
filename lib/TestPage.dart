import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/Models/ApiResponseModel.dart';
import 'package:mygold/Services/ServerRequest.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back))
      ]),
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.abc_sharp),
              onPressed: () {
                //_fetchAccountDetails(UserToken.token);
                Test_get_AccountDetials();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendUserPass,
        tooltip: 'Fetch data from server',
        child: const Icon(Icons.get_app_sharp),
      ),
    );
  }

//============================================================

  Future _fetchData(Object userPass) async {
    String url =
        'http://94.183.235.124/api/v1/UsersApi/SignIn'; //'http://94.183.235.124/api/v1/UsersApi/GetAllAcc2';
    //'http://94.183.235.124/api/v1/UsersApi/'; //;
    var body = userPass;
    var headers = {"Content-Type": "application/json"};
    UserToken.token = "";

    try {
      Response response =
          await post(Uri.parse(url), body: json.encode(body), headers: headers);
      var rjson = json.decode(utf8.decode(response.bodyBytes));
      UserToken.token = rjson["data"];
      //print("Token is: ${UserToken.token}");
      //setState(() {
      //ServerRequest(url, body, headers).fetchData();
      //UserToken.token = rjson["data"];
      //});
    } on Exception catch (_) {
      print("   خطا در هنگام دریافت اطلاعات از سرور");
      throw Exception("Error on server");
    } finally {}
  }

  void sendUserPass() async {
    var userPass = {"username": "admin", "password": "123456"};
    UserToken.token = "";
    await _fetchData(userPass);
    //print("Token is: ${UserToken.token}");
    if (UserToken.token.isNotEmpty) {
      //print("Token is: ${UserToken.token}");

      _showDialog("Login", "Login is successfull.");
    } else {
      _showDialog("Login", "Login is not successfull.");
    }
  }

  void _showDialog(String title, String text) {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        return AlertDialog(
          title: new Text(title),
          content: new Text(text),
          actions: [
            // usually buttons at the bottom of the dialog

            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _fetchAccountDetails(Object token) async {
    String url = 'http://94.183.235.124/api/v1/UsersApi/getbank3';

    var body = {"cod": "1118"};

    // var headers = {
    //   'Authorization': 'Bearer $token',
    // };

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    //print("Token is: $token");
    //print("headers is: $headers");

    ApiResponseData.data = "";
    ApiResponseData.isSuccess = false;
    ApiResponseData.message = [];
    ApiResponseData.statusCode = -1;

    await fetchData(url, body, headers);
  }

  Future fetchData(url, body, headers) async {
    ApiResponseModel apiResponseModel;
    try {
      Response response =
          await post(Uri.parse(url), body: json.encode(body), headers: headers);
      var rjson = json.decode(utf8.decode(response.bodyBytes));
      //var rjson = json.decode(response.body);

      print("Json is: $rjson");
      print("rjson[data] is : ${rjson["data"]}");

      //var data = json.decode(rjson["data"]);
      //print("Data is: $data");

      ApiResponseData.data = rjson["data"];
      ApiResponseData.isSuccess = rjson["isSuccess"];
      ApiResponseData.statusCode = rjson["statusCode"];
      ApiResponseData.message = rjson["message"];

      //print(ApiResponseData.data);

      //apiResponseModel = ApiResponseModel(rjson["data"], rjson["isSuccess"],
      //rjson["statusCode"], rjson["message"]);
      //ApiResponseData.data = apiResponseModel.data;
      //ApiResponseData.isSuccess = apiResponseModel.isSuccess;
      //ApiResponseData.message = apiResponseModel.message;
      //ApiResponseData.statusCode = apiResponseModel.statusCode;
      //if (kDebugMode) {
      // print(apiResponseModel);
      //}
      //print(apiResponseModel.isSuccess);
      //print(apiResponseModel.data);

    } on Exception catch (_) {
      print("   خطا در هنگام دریافت اطلاعات از سرور");
      throw Exception("Error on server");
    } finally {}
  }

  void Test_get_AccountDetials() async {
    String url = 'http://94.183.235.124/api/v1/UsersApi/getbank3';
    var body = {"cod": "1102", "officeId": "4601"};

    // var headers = {
    //   'Authorization': 'Bearer $token',
    // };

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserToken.token}',
    };

    //print("Token is: $token");
    //print("headers is: $headers");

    ApiResponseData.data = "";
    ApiResponseData.isSuccess = false;
    ApiResponseData.message = [];
    ApiResponseData.statusCode = -1;

    await ServerRequest(url, body, headers).fetchData();

    print("\n&&&&&&&&&&&&&&&&&&&&&&& Test &&&&&&&&&&&&&&&&&&&&&&");
    print(
        "\n  ApiResponseData.data ${ApiResponseData.data} &&&&&&&&&&&&&&&&&&&&&&");
    print("\n&&&&&&&&&&&&&&&&&&&&&&& Test &&&&&&&&&&&&&&&&&&&&&&");
  }
}
