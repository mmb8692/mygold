import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygold/Models/Models.dart';
import 'package:mygold/Services/RestApi.dart';
import 'package:mygold/Services/myCommonCode.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ایجاد کاربر جدید"),
        backgroundColor: Color.fromARGB(255, 15, 139, 241),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              //opacity: 1,
              //image: const AssetImage("images/Grey-Background.jpg"),
              image: const AssetImage("images/back5.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
              alignment: Alignment.center,
              repeat: ImageRepeat.repeat),
        ),
        child: SizedBox.expand(
          child: DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                //color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return viewRegister();
                  },
                ),
              );
            },
          ),
        ),

        /*       
        Padding(
          padding:
              const EdgeInsets.only(top: 2, bottom: 2, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: viewRegister()),
            ],
          ),
        ),
*/
      ),
/*      
      Container(
        width: double.infinity, //MediaQuery.of(context).size.width,
        height: double.infinity, //MediaQuery.of(context).size.height, //
        //color: Colors.red,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: const DecorationImage(
              //opacity: 1,
              //image: const AssetImage("images/Grey-Background.jpg"),
              image: const AssetImage("images/back8.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
              alignment: Alignment.center,
              repeat: ImageRepeat.repeat),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 1, left: 5, right: 30),
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.teal,
              ),
              borderRadius: BorderRadius.circular(30),
              //color: Colors.amber[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 0,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 2,
                  //alignment: Alignment.topCenter,
                  //color: Colors.amber[900],

                  child: Card(
                    borderOnForeground: true,
                    elevation: 10,

                    //color: Color.fromARGB(175, 255, 255, 255),
                    color: Colors.transparent,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      //width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 1, left: 20, right: 20, bottom: 1),
                      child: Column(children: [
                        myTextField(
                            'نام ',
                            'نام خود را وارد کنید',
                            Icons.person,
                            false,
                            TextInputType.name,
                            firstNameController),
                        myTextField(
                            'نام خانوادگی ',
                            'نام خانوادگی خود را وارد کنید',
                            Icons.family_restroom_rounded,
                            false,
                            TextInputType.name,
                            lastNameController),
                        myTextField(
                            'شماره همراه ',
                            'شماره تلفن خود را وارد کنید',
                            Icons.phone,
                            false,
                            TextInputType.phone,
                            phoneNumberController),
                        myTextField(
                            'نام کاربری ',
                            'یک نام کاربری وارد کنید',
                            Icons.email_rounded,
                            false,
                            TextInputType.text,
                            userNameController),
                        myTextField(
                            'ایمــــل ',
                            'ایمیل خود را وارد کنید',
                            Icons.person_add,
                            false,
                            TextInputType.emailAddress,
                            emailController),
                        myTextField(
                            'کلمه عبور ',
                            'کلمه عبور خود را وارد کنید',
                            Icons.key_rounded,
                            true,
                            TextInputType.text,
                            passwordController),
                        myTextField(
                            'تکرار کلمه عبور',
                            'کلمه عبور خود را تکرار کنید',
                            Icons.key_rounded,
                            true,
                            TextInputType.text,
                            confirmPasswordController),
                      ]),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      myButtom(
                          'ایجاد کاربر ',
                          Colors.white,
                          Color.fromARGB(255, 36, 255, 7),
                          Icons.person_add, () {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          MyCommon.myShowDialog('خطـــــا',
                              'کلمه عبور با تکرار آن برابر نیست', context);
                          return;
                        }
                        RegisterData data = RegisterData();
                        data.FirstName = firstNameController.text;
                        data.Lastname = lastNameController.text;
                        data.PhoneNumber = phoneNumberController.text;
                        data.email = emailController.text;
                        data.userName = userNameController.text;
                        data.password = passwordController.text;
                        data.confirmPassword = confirmPasswordController.text;

                        register(data);
                      }),
                      myButtom('انصراف', Colors.white, Colors.red,
                          Icons.cancel_rounded, () {
                        Navigator.of(context).pop();
                      }),
                    ])
              ],
            ),
          ),
        ),
      ),
      */

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'برگشت به صفحه قبل',
        backgroundColor: Colors.blueGrey[900],
        child: const Icon(Icons.arrow_back_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      */
    );
  }

//=============================================================================
  Widget viewRegister() {
    return (Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 10, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(15),
          //color: Colors.amber[900],
          //color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              borderOnForeground: true,
              elevation: 10,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(children: [
                myTextField('نام ', 'نام خود را وارد کنید', Icons.person, false,
                    TextInputType.name, firstNameController),
                myTextField(
                    'نام خانوادگی ',
                    'نام خانوادگی خود را وارد کنید',
                    Icons.family_restroom_rounded,
                    false,
                    TextInputType.name,
                    lastNameController),
                myTextField(
                    'شماره همراه ',
                    'شماره تلفن خود را وارد کنید',
                    Icons.phone,
                    false,
                    TextInputType.phone,
                    phoneNumberController),
                myTextField(
                    'نام کاربری ',
                    'یک نام کاربری وارد کنید',
                    Icons.email_rounded,
                    false,
                    TextInputType.text,
                    userNameController),
                myTextField(
                    'ایمــــل ',
                    'ایمیل خود را وارد کنید',
                    Icons.person_add,
                    false,
                    TextInputType.emailAddress,
                    emailController),
                myTextField(
                    'کلمه عبور ',
                    'کلمه عبور خود را وارد کنید',
                    Icons.key_rounded,
                    true,
                    TextInputType.text,
                    passwordController),
                myTextField(
                    'تکرار کلمه عبور',
                    'کلمه عبور خود را تکرار کنید',
                    Icons.key_rounded,
                    true,
                    TextInputType.text,
                    confirmPasswordController),
              ]),
            ),

            //),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  myButtom('ایجاد کاربر ', Colors.white,
                      Color.fromARGB(255, 36, 255, 7), Icons.person_add, () {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      MyCommon.myShowDialog('خطـــــا',
                          'کلمه عبور با تکرار آن برابر نیست', context);
                      return;
                    }
                    RegisterData data = RegisterData();
                    data.FirstName = firstNameController.text;
                    data.Lastname = lastNameController.text;
                    data.PhoneNumber = phoneNumberController.text;
                    data.email = emailController.text;
                    data.userName = userNameController.text;
                    data.password = passwordController.text;
                    data.confirmPassword = confirmPasswordController.text;

                    register(data);
                  }),
                  myButtom(
                      'انصراف', Colors.white, Colors.red, Icons.cancel_rounded,
                      () {
                    Navigator.of(context).pop();
                  }),
                ])
          ],
        ),
      ),
    ));
  }

//-----------------------------------------------------------------------------
  Widget myTextField(
      String? lable,
      String? hint,
      IconData icon,
      bool isobscureText,
      TextInputType keyboardType,
      TextEditingController controler) {
    return (Padding(
      padding: const EdgeInsets.all(10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controler,
          textDirection: TextDirection.rtl,
          obscureText: isobscureText,
          keyboardType: keyboardType,
          autofocus: true,
          //enableInteractiveSelection: true,
          decoration: InputDecoration(
              //fillColor: Colors.blue,
              hintTextDirection: TextDirection.rtl,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: lable,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: hint,
              alignLabelWithHint: true,
              icon: Icon(
                icon,
                color: Colors.amber,
                size: 25,
              )),
          style: TextStyle(
              color: Color.fromARGB(255, 255, 238, 1),
              fontSize: 17,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none),
          //textAlign: TextAlign.right,
        ),
      ),
    ));
  }

//-----------------------------------------------------------------------------
  Widget myButtom(String text, Color textcolor, Color borderColor,
      IconData icon, Function func) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: (Row(
        textDirection: TextDirection.rtl,
        children: [
          InkWell(
            onTap: () {
              func();
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 15,
              padding: EdgeInsets.only(right: 15, left: 15, top: 1, bottom: 1),
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: 15,
                    color: Colors.white,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      //decoration: TextDecoration.underline,
                      //decorationThickness: 0.85,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

//-----------------------------------------------------------------------------
  Future register(RegisterData registerData) async {
    print("\n ------------ AccountDetails.getAccountDetials ----------");
    try {
      String url = 'http://94.183.235.124/api/v1/UsersApi/register';
      var body = {
        'FirstName': registerData.FirstName,
        'LastName': registerData.Lastname,
        'PhoneNumber': registerData.PhoneNumber,
        'email': registerData.email,
        'userName': registerData.userName,
        'password': registerData.password,
        'confirmPassword': registerData.confirmPassword,
      };

      print("\n ---------------- RegisterPage.register -----------------");

      print("\n body : ${body} ");

      var jsonData;
      await RestApi()
          .FetchData(url, null, body)
          .then((value) => jsonData = value)
          .onError((error, stackTrace) => print("error is: $error"));

      if (jsonData == 'True')
        MyCommon.myShowDialog(
            'ثبت کاربر جدید', 'عملیات با موفقیت انجام شد', context);
      else
        MyCommon.myShowDialog(
            'خطا',
            'نام کاربری و ایمیل نباید تکراری باشد همچنین کلمه عبور باید حداقل 6 کاراکتری باشد.',
            context);

      print("\n ---------------- RegisterPage.register -----------------");
      //print(
      //    "\n AccountDetails.getAccountDetials ---> jsonData[data] Typeof:=== ${jsonData["data"].runtimeType}  And Data isssssss: ${jsonData["data"]}");
      print("\n ---------------- RegisterPage.register -----------------");
      print(
          "\n AccountDetails.getAccountDetials ---> Type And Data of jsonData : ${jsonData.runtimeType} == $jsonData");

      //var decodedData = json.decode(jsonData);
      print("\n ---------------- RegisterPage.register -----------------");

      //print("\n decodedData : ${decodedData} ");
//--------------------------------------------------------------------------------------------------------
      print(
          "//--------------------------------------------------------------------");

//--------------------------------------------------------------------------------------------------------
    } catch (e) {
      print("خطایی رخ داده است : ${e.toString()}");
    }
  }
}
