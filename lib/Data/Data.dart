import 'package:mygold/Models/Models.dart';

class UserToken {
  static String token = "";
  static String tt = "";
}

class ApiResponseData {
  static String data = "";
  static bool isSuccess = false;
  static int statusCode = -1;
  static List<dynamic> message = [];
}

class AccountData {
  static List<Bank1_min> accountList = [];
  static List<Bank3_min> accountDetailsList = [];
}
