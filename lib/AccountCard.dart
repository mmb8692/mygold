// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygold/AccountDetialsPage.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/Models/Models.dart';
import 'package:mygold/Services/RestApi.dart';
import 'package:intl/intl.dart' as intl;

class AccountCard extends StatefulWidget {
  final Bank1_min _account;
  const AccountCard(this._account, {Key? key}) : super(key: key);

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return myCard();
  }

//==========================================================
  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 1, left: 8, right: 8),
      child: InkWell(
        onTap: () async {
//-----------------------------------
          await getAccountDetials(
              double.parse(widget._account.cod), widget._account.officeId!);
//-----------------------------------
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AccountDetails(
                  double.parse(widget._account.cod),
                  widget._account.officeId!)));
        },
        child: Card(
            elevation: 10,
            //color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 1, right: 15, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        myShowFields(
                            ' :نام فروشگاه', widget._account.officeName),
                        myShowFields('', widget._account.name),
                        myShowFields(
                            ' :آخرین فاکتــــور', widget._account.factor),
                        myShowFields(
                            ' :تاریخ آخرین تراکنش', widget._account.tariz),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //textDirection: TextDirection.rtl,
                      children: [
                        myShowMojoodyCard(' :موجودی ریالی', '',
                            widget._account.r_bes!, widget._account.r_bed!),
                        myShowMojoodyVaznCard(' :موجودی وزنی', '',
                            widget._account.v_bes!, widget._account.v_bed!),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
//==========================================================

  //----------------------------------------------------------------------------
  Widget myShowFields(String? onvan, String? matn) {
    return Container(
      //width: MediaQuery.of(context).size.width / 6,
      child: (Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            onvan!,
            style: TextStyle(
                fontFamily: 'Tahoma',
                fontSize: 15,
                fontWeight: FontWeight.w800),
          ),
          Text(
            matn ?? '-',
            textAlign: TextAlign.justify,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Tahoma',
                fontSize: 15,
                fontWeight: FontWeight.w800),
          ),
        ],
      )),
    );
  }

  //----------------------------------------------------------------------------
  Widget myShowMojoodyCard(String onvan, String matn, double bed, double bes) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Text(onvan),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            //width: 100,
            height: 30,
            alignment: Alignment.center,

            child: Text(
              //mojoody(bes,bed).toStringAsFixed(0),
              myRialFormat(mojoody(bes, bed)),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Tahoma',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: mojoody(bes, bed).sign == 1
                      ? Colors.green[400]
                      : Colors.red[400]),
            ),
          ),
        ),
      ],
    ));
  }

  //----------------------------------------------------------------------------
  Widget myShowMojoodyVaznCard(
      String onvan, String matn, double bed, double bes) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Text(onvan),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            //width: 100,
            height: 30,
            alignment: Alignment.center,

            child: Text(
              //mojoody(bes,bed).toStringAsFixed(0),
              myStringFormatAsFixed(mojoody(bes, bed), 3),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Tahoma',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: mojoody(bes, bed).sign == 1
                      ? Colors.green[400]
                      : Colors.red[400]),
            ),
          ),
        ),
      ],
    ));
  }

  //----------------------------------------------------------------------------
  double mojoody(double bed, double bes) {
    double result = bes - bed;
    //String outresult = result.
    //return result.toString().substring(result.toString().indexOf('.'), 3);
    return result;
  }

//-------------------------------------------------------------------------
  // String myRialFormat(double num) {
  //   String result = '';
  //   if (num == 0)
  //     result = '0';
  //   else
  //     // result = intl.NumberFormat.simpleCurrency(
  //     //     locale: 'fa', name: ' ریال ', decimalDigits: 0)
  //     //     .format(num);
  //     result = intl.NumberFormat.simpleCurrency(
  //             locale: 'fa', name: '', decimalDigits: 0)
  //         .format(num);
  //   return result;
  // }
  String myRialFormat(double? num) {
    String result = '';
    if (num == 0) {
      result = '0';
    } else if (num == 'null' || num == 'Null' || num == 'NULL' || num == null) {
      result = '-';
    } else
      result = intl.NumberFormat.simpleCurrency(
              locale: 'fa', name: '', decimalDigits: 0)
          .format(num);
    return result;
  }

//----------------------------------------------------------------------

//-------------------------------------------------------------------------
  String myStringFormatAsFixed(double? txt, int chandRaghamAashar) {
    if (txt == 0) return '0';
    if (txt == null) return '-';
    return txt.toStringAsFixed(chandRaghamAashar);
  }
//----------------------------------------------------------------------

  Future getAccountDetials(double accountCode, String officeId) async {
    print("\n ------------ AccountDetails.getAccountDetials ----------");
    try {
      String url = 'http://94.183.235.124/api/v1/UsersApi/getbank3';
      var body = {"cod": accountCode.toStringAsFixed(0), "officeId": officeId};

      var jsonData;
      await RestApi()
          .FetchData(url, UserToken.token, body)
          .then((value) => jsonData = value)
          .onError((error, stackTrace) => print("error is: $error"));

      print("\n ------------ AccountDetails.getAccountDetials ----------");
      //print(
      //    "\n AccountDetails.getAccountDetials ---> jsonData[data] Typeof:=== ${jsonData["data"].runtimeType}  And Data isssssss: ${jsonData["data"]}");
      print("\n ------------ AccountDetails.getAccountDetials ----------");
      print(
          "\n AccountDetails.getAccountDetials ---> Type And Data of jsonData : ${jsonData.runtimeType} == $jsonData");

      print("\n ------------ AccountDetails.getAccountDetials ----------");

      print("\n jsonData : ${jsonData} ");

      //var dd = json.decode(jsonData);
      //print(
      //    "\n AccountDetails.getAccountDetials ---> Type And Data of dd : ${dd.runtimeType} == $dd");
      //for (var item in dd) {}

      var decodedData = json.decode(jsonData);
      AccountData.accountDetailsList.clear();
      for (var item in decodedData) {
        Bank3_min accountDetails = Bank3_min();
        item.forEach((key, value) => FileBank_3(accountDetails, key, value));
        AccountData.accountDetailsList.add(accountDetails);
      }

      print(
          "AccountData.accountDetailsList.length = ${AccountData.accountDetailsList.length}");
      print(
          "AccountData.accountDetailsList.last.Name = ${AccountData.accountDetailsList.last.Name}");
      print(
          "AccountData.accountDetailsList.last.Sanad = ${AccountData.accountDetailsList.last.Sanad}");
      print(
          "AccountData.accountDetailsList.last.Factor = ${AccountData.accountDetailsList.last.Factor}");
      print(
          "AccountData.accountDetailsList.last.R_bed = ${AccountData.accountDetailsList.last.R_bed}");
      print(
          "AccountData.accountDetailsList.last.R_bes = ${AccountData.accountDetailsList.last.R_bes}");
      print(
          "AccountData.accountDetailsList.last.v_bed = ${AccountData.accountDetailsList.last.v_bed}");
      print(
          "AccountData.accountDetailsList.last.v_bes = ${AccountData.accountDetailsList.last.v_bes}");
      print(
          "AccountData.accountDetailsList.last.Ayar = ${AccountData.accountDetailsList.last.Ayar}");
//--------------------------------------------------------------------------------------------------------
      print(
          "//--------------------------------------------------------------------");

      for (var item in AccountData.accountDetailsList) {
        print("Name : ${item.Name}");
      }

      print(
          "//--------------------------------------------------------------------");

//--------------------------------------------------------------------------------------------------------
    } catch (e) {
      print("خطایی رخ داده است : ${e.toString()}");
    }
  }

  void FileBank_3(Bank3_min details, var key, var value) {
    key == 'Sanad' ? details.Sanad = value : {};
    key == 'Radef' ? details.Radef = value : {};
    key == 'Cod' ? details.Cod = value : {};
    key == 'Name' ? details.Name = value : {};
    key == 'Factor' ? details.Factor = value : {};
    key == 'tariz' ? details.tariz = value : {};
    key == 'Sh' ? details.Sh = value : {};
    key == 'N_sanad' ? details.N_sanad = value : {};
    key == 'v_1' ? details.v_1 = value : {};
    key == 'Ayar' ? details.Ayar = value : {};
    key == 'V_750' ? details.V_750 = value : {};
    key == 'Adad' ? details.Adad = value : {};
    key == 'adad_bed' ? details.adad_bed = value : {};
    key == 'adad_bes' ? details.adad_bes = value : {};
    key == 'ojrat' ? details.ojrat = value : {};
    key == 'oj_bed' ? details.oj_bed = value : {};
    key == 'oj_bes' ? details.oj_bes = value : {};
    key == 'reyall' ? details.reyall = value : {};
    key == 'v_bed' ? details.v_bed = value : {};
    key == 'v_bes' ? details.v_bes = value : {};
    key == 'mv_bed' ? details.mv_bed = value : {};
    key == 'mv_bes' ? details.mv_bes = value : {};
    key == 'R_bed' ? details.R_bed = value : {};
    key == 'R_bes' ? details.R_bes = value : {};
    key == 'ID' ? details.ID = value : {};
    key == 'RV' ? details.RV = value : {};
  }
  //-------------------------------------------------------
}

/*
//==========================================================
  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 1, left: 8, right: 8),
      child: InkWell(
        onTap: () async {
//-----------------------------------
          await getAccountDetials(
              double.parse(widget._account.cod), widget._account.officeId!);
//-----------------------------------

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AccountDetails(
                  double.parse(widget._account.cod),
                  widget._account.officeId!)));
        },
        child: Card(
            elevation: 10,
            //color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 1, right: 15, top: 10, bottom: 10),
              child: Container(
                //height: 150,
                //width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          " نام فروشگاه : " +
                              (widget._account.officeName ?? '-'),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget._account.name ?? '-',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Tahoma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                            "آخرین فاکتــــور  : " +
                                (widget._account.factor ?? '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                          " تاریخ آخرین تراکنش : " +
                              (widget._account.tariz ?? '-'),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //textDirection: TextDirection.rtl,
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            width: 200,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(" : موجودی ریالی"),
                                Text(
                                  mojoody(widget._account.r_bes!,
                                          widget._account.r_bed!)
                                      .toStringAsFixed(0),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Tahoma',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: mojoody(widget._account.r_bes!,
                                                      widget._account.r_bed!)
                                                  .sign ==
                                              1
                                          ? Colors.green[400]
                                          : Colors.red[400]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Container(
                            width: 200,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(" : موجودی وزنی"),
                                Text(
                                  mojoody(widget._account.v_bes!,
                                          widget._account.v_bed!)
                                      .toStringAsFixed(3),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Tahoma',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: mojoody(widget._account.v_bes!,
                                                      widget._account.v_bed!)
                                                  .sign ==
                                              1
                                          ? Colors.green[400]
                                          : Colors.red[400]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
//==========================================================

  double mojoody(double bed, double bes) {
    double result = bes - bed;
    //String outresult = result.
    //return result.toString().substring(result.toString().indexOf('.'), 3);
    return result;
  }
*/
//----------------------------------------------------------------------

