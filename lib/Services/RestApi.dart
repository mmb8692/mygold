import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:mygold/Data/Data.dart';

/*
class UserToken {
  static String token = "";
}

class ApiResponseData {
  static String data = "";
  //static List<dynamic> data = [];
  static bool isSuccess = false;
  static int statusCode = -1;
  static List<dynamic> message = [];
}
*/
class RestApi {
  //String _url;
  //Object _body;
  //Map<String, String> _headers;
  //RestApi(this._url, this._body, this._headers);

  Future GetLoginToken(String url, String userName, String password) async {
    Uri uri = Uri.parse(url);
    var userPass = {"username": userName, "password": password};
    var body = userPass;
    var headers = {"Content-Type": "application/json"};
    UserToken.token = "";
    try {
      print("body : ${json.encode(body)}");
      print("URI : $uri");
      Response response =
          await post(uri, body: json.encode(body), headers: headers);
      print("Respons : $response");
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      print("jsonData[data] isssssss: ${jsonData["data"]}");
      UserToken.token = jsonData["data"];
      print("UserToken.token ===========: ${UserToken.token}");
      //print("jsonData : $jsonData");
    } on HttpException catch (e) {
      print("Error post: $e");
      print("   خطا در هنگام دریافت اطلاعات از سرور");
      throw Exception("Error on server");
    } finally {}
  }

  Future<dynamic> FetchData(String url, Object? token, Object? _body) async {
    Uri uri = Uri.parse(url);
    var body = _body;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    print("\n ------------------ RestApi.FetchData ------------------------");
    print("\n url : $url");
    print("\n body : $body");
    print("\n --------------------------------------------------------------");
    print('\n json.encode(body) : ${json.encode(body)} ');
    print("\n --------------------------------------------------------------");
    print("\n token : $token");
    try {
      Response response =
          await post(uri, body: json.encode(body), headers: headers);

      print("\n RestApi.FetchData ---> Response : ${response.body}");

      var jsonData = json.decode(utf8.decode(response.bodyBytes));

      //print(
      //    "\n RestApi.FetchData ---> jsonData[data] Typeof:=== ${jsonData["data"].runtimeType}  And Data isssssss: ${jsonData["data"]}");

      //List<dynamic> data = jsonData["data"];
      //print(
      //    "data[0].runtimeType = ${data[0].runtimeType} and dat is: ${data[0]}");
      return jsonData["data"];
      //return response;
    } on Exception catch (_) {
      print("   خطا در هنگام دریافت اطلاعات از سرور");
      throw Exception("Error on server");
    } finally {}
  }

  bool login() {
    bool result = false;
    GetLoginToken(
            "http://94.183.235.124/api/v1/UsersApi/SignIn", "admin", "123456")
        .then((value) => result = true)
        .onError((error, stackTrace) => result = false);
    return result;
  }

  void GetAccounts1() {
    FetchData(
        'http://94.183.235.124/api/v1/UsersApi/getbank11', UserToken.token, {});
  }
}
