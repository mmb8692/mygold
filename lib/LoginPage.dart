import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/RegisterPage.dart';
import 'package:mygold/Services/ServerRequest.dart';
import 'package:mygold/Services/myCommonCode.dart';
import 'package:mygold/ViewAccount.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return LoginView();
  }

//=========================================================
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Widget LoginView() {
    return Container(
      //height: 90,
      //width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        elevation: 50,
        color: Colors.white10,
        //color: Colors.transparent,
/*
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(10, 10),
          ),
          //side: BorderSide.none,
        ),
*/

        child: Padding(
          padding: const EdgeInsets.all(5),
          // child: DecoratedBox(
          //   decoration: const BoxDecoration(
          //     image: const DecorationImage(
          //         opacity: 0,
          //         image: const AssetImage(""),
          //         fit: BoxFit.fill,
          //         alignment: Alignment.centerRight),

          //     /*image: const DecorationImage(
          //         opacity: 100,
          //         image: const AssetImage("images/4.jpg"),
          //         fit: BoxFit.fill,
          //         alignment: Alignment.centerRight),*/
          //   ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //------------------------------------------------------
              myTextField(
                  'نام کاربری', usernamecontroller, false, Icons.person),
              myTextField(
                  'کلمه عبور', passwordcontroller, true, Icons.key_rounded),
              //------------------------------------------------------
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40, //MediaQuery.of(context).size.height / 17,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 243, 51, 211),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "خروج",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40, //MediaQuery.of(context).size.height / 17,
                    //color: Colors.blue[50],
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 7, 181, 250),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                        onPressed: sendUserPass,
                        child: Text(
                          "ورود",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 10, top: 1, bottom: 1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 36, 255, 7),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(
                              Icons.person_add_alt_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Text(
                              "ایجاد کاربر جدید",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                                //decoration: TextDecoration.underline,
                                decorationThickness: 0.85,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//==============================================================================
  Widget myTextField(String label, TextEditingController? controller,
      bool isobscureText, IconData icon) {
    return (Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 15, left: 15),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller, //passwordcontroller,
          obscureText: isobscureText,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(color: Colors.teal),
            ),
            icon: Icon(
              icon,
              color: Colors.amber,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            labelText: label, //'کلمه عبور',
          ),
        ),
      ),
    ));
  }

//------------------------------------------------------------------------------
  Future _fetchData(Object userPass) async {
    String url =
        'http://94.183.235.124/api/v1/UsersApi/SignIn'; //'http://94.183.235.124/api/v1/UsersApi/GetAllAcc2';
    //'http://94.183.235.124/api/v1/UsersApi/'; //;
    var body = userPass;
    var headers = {"Content-Type": "application/json"};
    //UserToken.token = "";

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
    var userPass = {
      "username": usernamecontroller.text,
      "password": passwordcontroller.text
    };
    UserToken.token = "";
    await _fetchData(userPass);
    //print("Token is: ${UserToken.token}");
    if (UserToken.token.isNotEmpty) {
      //print("Token is: ${UserToken.token}");

      //_showDialog("Login", "Login is successfull.");

      await _fetchAccounts(UserToken.token)
          .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ViewAccount())))
          .onError((error, stackTrace) =>
              MyCommon.myShowDialog("error", error.toString(), context));
    } else {
      MyCommon.myShowDialog("Login", "Login is not successfull.", context);
    }
  }

/*
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
*/
  Future _fetchAccounts(Object token) async {
    String url = 'http://94.183.235.124/api/v1/UsersApi/getbank1';

    var body = {};

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

    //ApiResponseData.data = "";
    ApiResponseData.isSuccess = false;
    ApiResponseData.message = [];
    ApiResponseData.statusCode = -1;

    await ServerRequest(url, body, headers).fetchData();

    // setState(() async {
    //   await ServerRequest(url, body, headers).fetchData();

    //   if (kDebugMode) {
    //     //print("Data is: ${ApiResponseData.data}");
    //   }
    //   if (kDebugMode) {
    //     //print(ApiResponseData.isSuccess);
    //   }
    // });
  }
}
