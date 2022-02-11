import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/Models/ApiResponseModel.dart';

class ServerRequest {
  String _url;
  Object _body;
  Map<String, String> _headers;
  ServerRequest(this._url, this._body, this._headers);

  Future fetchData() async {
    //ApiResponseModel apiResponseModel;
    try {
      Response response = await post(Uri.parse(_url),
          body: json.encode(_body), headers: _headers);
      var rjson = json.decode(utf8.decode(response.bodyBytes));
      //var rjson = json.decode(response.body);

      //print("Json is: $rjson");
      //var data = json.decode(rjson["data"]);
      //print("Json2 is: $data");
      //print(rjson["data"]);

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

/*
  FetchData() async {
    print(_url);
    print(_body);
    print(_headers);
  }
  */
}
