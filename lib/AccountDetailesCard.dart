import 'package:flutter/material.dart';
import 'package:mygold/Models/Models.dart';
import 'package:persian_fonts/persian_fonts.dart';
//import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
//import 'package:format/format.dart';
import 'package:intl/intl.dart' as intl;

class AccountDetailesCard extends StatefulWidget {
  final Bank3_min _accountDetailes;
  const AccountDetailesCard(this._accountDetailes, {Key? key})
      : super(key: key);

  @override
  State<AccountDetailesCard> createState() => _AccountDetailesCardState();
}

class _AccountDetailesCardState extends State<AccountDetailesCard> {
  @override
  Widget build(BuildContext context) {
    return myCard6();
  }

//----------------------------------------------------------------------------
  Widget myCard6() {
    int raghamAashar = 3;
    //var formatter = NumberFormat('#,##,000');
    // Color onvanColor = Colors.amber;
    // Color matnColor = Colors.white;
    // double faseleMatnVaOnvan = 7;
    // double fontSizeOnvan = 15;
    // double fontSizeMatn = 15;

    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 1, left: 8, right: 8),
      child: Card(
        elevation: 10,
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
              //width: MediaQuery.of(context).size.width - 50,
              //height: MediaQuery.of(context).size.height / 5 - 20,
              //color: Colors.blueGrey[800],
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    opacity: 1,
                    image: AssetImage('images/back-grey3.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          widget._accountDetailes.Name.toString(),
                          /*
                          style: TextStyle(
                            fontFamily: 'IranNastaliq.ttf',
                            fontSize: 50,
                            color: Colors.white,
                          ),*/
                          style: PersianFonts.Yekan.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    Center(
                      child: Card(
                        elevation: 2,
                        color: Color.fromARGB(31, 247, 237, 237),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 80,
                          height: 33,
                          child: Column(children: [
                            Container(
                              height: 5,
                              color: Colors.black12,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width - 100,
                            //   height: 1,
                            //   color: Colors.white,
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showFiled('فاکتور  :',
                                    (widget._accountDetailes.Factor ?? '-')),
                                showFiled(
                                    'ردیف  :',
                                    (widget._accountDetailes.Radef != null
                                        ? widget._accountDetailes.Radef
                                            .toString()
                                        : '-')),
                                showFiled('تاریخ  : ',
                                    (widget._accountDetailes.tariz ?? '-')),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ),

                    //--------------------------------------------------------------------------
                    Center(
                      child: Card(
                        elevation: 5,
                        color: Color.fromARGB(31, 247, 237, 237),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 80,
                          height: 33,
                          child: Column(children: [
                            Container(
                              height: 5,
                              //color: Colors.black12,
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.auto_awesome_mosaic_rounded,
                                  color: Colors.amber,
                                ),
                                showFiled(
                                    'وزن  : ',
                                    myStringFormatAsFixed(
                                        widget._accountDetailes.v_1,
                                        raghamAashar)),
                                showFiled(
                                    'عیار  : ',
                                    myStringFormatAsFixed(
                                        widget._accountDetailes.Ayar, 0)),
                                showFiled(
                                    'وزن750  : ',
                                    myStringFormatAsFixed(
                                        widget._accountDetailes.V_750,
                                        raghamAashar)),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ),
                    //--------------------------------------------------------------------------
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 25, top: 0, bottom: 0),
                      child: showFiledSharh(
                        'شرح :',
                        (widget._accountDetailes.Sh ?? '-'),
                      ),
                    ),
                    //--------------------------------------------------------------------------

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 1),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //--------------------------+++---------------------------
                          showFiled(
                              'تعداد  : ',
                              myStringFormatAsFixed(
                                  widget._accountDetailes.Adad, 0)),
                          //------------------------------------------------------
                          showFiled('مبلغ  : ',
                              myRialFormat(widget._accountDetailes.reyall)),
                        ],
                      ),
                    ),
                    //--------------------------------------------------------------------------
                  ])),
        ),
      ),
    );
  }
//==========================================================

//-------------------------------------------------------------------------
  double mojoody(double bed, double bes) {
    double result = bes - bed;
    return result;
  }

//-------------------------------------------------------------------------
  String myStringFormatAsFixed(double? txt, int chandRaghamAashar) {
    if (txt == 0) return '0';
    if (txt == null) return '-';
    return txt.toStringAsFixed(chandRaghamAashar);
  }

//-------------------------------------------------------------------------
  String myRialFormat(double? num) {
    String result = '';
    if (num == 0) {
      result = '0';
    } else if (num == null) {
      result = '-';
    } else {
      result = intl.NumberFormat.simpleCurrency(
              locale: 'fa', name: ' ریال ', decimalDigits: 0)
          .format(num);
    }
    return result;
  }

//-------------------------------------------------------------------------
  Widget showFiled(String? onvan, String? matn) {
    Color onvanColor = Colors.amber;
    Color matnColor = Colors.white;
    double faseleMatnVaOnvan = 5;
    double fontSizeOnvan = 12;
    double fontSizeMatn = 12;

    return (Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          onvan!,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.justify,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: PersianFonts.Yekan.copyWith(
              fontSize: fontSizeOnvan,
              fontWeight: FontWeight.bold,
              color: onvanColor),
        ),
        SizedBox(
          width: faseleMatnVaOnvan,
        ),
        Text(
          matn!,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.justify,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: PersianFonts.Yekan.copyWith(
              fontSize: fontSizeMatn,
              fontWeight: FontWeight.bold,
              color: matnColor),
        ),
      ],
    ));
  }

  //-------------------------------------------------------------------------
  Widget showFiledSharh(String? onvan, String? matn) {
    Color onvanColor = Colors.amber;
    Color matnColor = Colors.white;
    double faseleMatnVaOnvan = 5;
    double fontSizeOnvan = 12;
    double fontSizeMatn = 12;

    return (Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          onvan!,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.justify,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: PersianFonts.Yekan.copyWith(
              fontSize: fontSizeOnvan,
              fontWeight: FontWeight.bold,
              color: onvanColor),
        ),
        SizedBox(
          width: faseleMatnVaOnvan,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 120,
          child: Text(
            matn!,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: PersianFonts.Yekan.copyWith(
                fontSize: fontSizeMatn,
                fontWeight: FontWeight.bold,
                color: matnColor),
          ),
        ),
      ],
    ));
  }
  //-------------------------------------------------------------
}


/*
//==========================================================
  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 1, left: 8, right: 8),
      child: InkWell(
        onTap: () {},
        child: Card(
            elevation: 10,
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
                          widget._accountDetailes.Name ?? '-',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Tahoma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "  نام حساب : " +
                              (widget._accountDetailes.Name.toString() ?? '-'),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " تاریخ  : " + (widget._accountDetailes.tariz ?? '-'),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                            "فاکتــــور  : " +
                                (widget._accountDetailes.Factor.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "ردیف  : " +
                                (widget._accountDetailes.Radef.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "شرح  : " +
                                (widget._accountDetailes.Sh.toString() ?? '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "وزن  : " +
                                (widget._accountDetailes.v_1!
                                        .toStringAsFixed(3) ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "عیار  : " +
                                (widget._accountDetailes.Ayar.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "وزن750  : " +
                                (widget._accountDetailes.V_750!
                                        .toStringAsFixed(3) ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "تعداد  : " +
                                (widget._accountDetailes.Adad.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(
                            "مبلغ  : " +
                                (widget._accountDetailes.reyall.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
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
                                  mojoody(widget._accountDetailes.R_bed!,
                                          widget._accountDetailes.R_bed!)
                                      .toStringAsFixed(0),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Tahoma',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: mojoody(
                                                      widget._accountDetailes
                                                          .R_bes!,
                                                      widget._accountDetailes
                                                          .R_bed!)
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
                                  mojoody(widget._accountDetailes.v_bes!,
                                          widget._accountDetailes.v_bed!)
                                      .toStringAsFixed(3),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Tahoma',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: mojoody(
                                                      widget._accountDetailes
                                                          .v_bes!,
                                                      widget._accountDetailes
                                                          .v_bed!)
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

  //----------------------------------------------------------------------------
  Widget myCard2() {
    return Column(
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3 - 50,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                    opacity: 1,
                    image: const AssetImage("images/Golden_Background3.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column()
              /*Image(
              image: AssetImage("images/Golden_Background3.jpg"),
              fit: BoxFit.cover,
            ),
            */
              ),
          color: Colors.blueGrey[700],
        ),
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1 / 3,
            //color: Colors.grey[900],
            decoration: const BoxDecoration(
              image: const DecorationImage(
                  opacity: 1,
                  image: const AssetImage("images/back3.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Row(),
          ),
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  Widget myCard3() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2 / 3 - 50,

        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: const AssetImage("images/back3.jpg"),
              fit: BoxFit.cover),
        ),
        child:

//--------------------------------------------------------------------------------

            Row(
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
                    widget._accountDetailes.Name ?? '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 45,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 207, 243, 4)),
                  ),
                  Text(
                    "  نام حساب : " +
                        (widget._accountDetailes.Name.toString() ?? '-'),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 207, 243, 4)),
                  ),
                  Text(
                    " تاریخ  : " + (widget._accountDetailes.tariz ?? '-'),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 207, 243, 4)),
                  ),
                  Text(
                      "فاکتــــور  : " +
                          (widget._accountDetailes.Factor.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "ردیف  : " +
                          (widget._accountDetailes.Radef.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "شرح  : " +
                          (widget._accountDetailes.Sh.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "وزن  : " +
                          (widget._accountDetailes.v_1!.toStringAsFixed(3) ??
                              '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "عیار  : " +
                          (widget._accountDetailes.Ayar.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "وزن750  : " +
                          (widget._accountDetailes.V_750!.toStringAsFixed(3) ??
                              '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "تعداد  : " +
                          (widget._accountDetailes.Adad.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                  Text(
                      "مبلغ  : " +
                          (widget._accountDetailes.reyall.toString() ?? '-'),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 207, 243, 4))),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mojoody(widget._accountDetailes.R_bed!,
                                      widget._accountDetailes.R_bed!)
                                  .toStringAsFixed(0),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Tahoma',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: mojoody(
                                                  widget
                                                      ._accountDetailes.R_bes!,
                                                  widget
                                                      ._accountDetailes.R_bed!)
                                              .sign ==
                                          1
                                      ? Colors.green[400]
                                      : Colors.red[400]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ]),
//-------------------------------------------------------------------------------
      ),
      color: Colors.blueGrey[700],
    );
  }

  //----------------------------------------------------------------------------
  Widget myCard4() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Colors.blueGrey[800],
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: const AssetImage("images/back-grey3.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Card(
                  elevation: 10,
                  color: Colors.black12,
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
                                  widget._accountDetailes.Name ?? '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Tahoma',
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                    "آخرین فاکتــــور  : " +
                                        (widget._accountDetailes.Factor ?? '-'),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  " تاریخ آخرین تراکنش : " +
                                      (widget._accountDetailes.tariz ?? '-'),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Text(
                              widget._accountDetailes.Name ?? '-',
                              textAlign: TextAlign.center,
                              style: PersianFonts.Shabnam.copyWith(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              /*
            style: TextStyle(
                fontFamily: 'IranNastaliq',
                fontSize: 75,
                fontWeight: FontWeight.w800,
                //color: Color.fromARGB(255, 207, 243, 4)),
                color: Color.fromARGB(255, 255, 255, 255)
                ),
                */
                            ),
                            Text(
                              "  نام حساب : " +
                                  (widget._accountDetailes.Name.toString() ??
                                      '-'),
                              style: TextStyle(
                                  fontFamily: 'IranNastaliq',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 207, 243, 4)),
                            ),
                            Text(
                              " تاریخ  : " +
                                  (widget._accountDetailes.tariz ?? '-'),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 207, 243, 4)),
                            ),
                            Text(
                                "فاکتــــور  : " +
                                    (widget._accountDetailes.Factor
                                            .toString() ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                                "ردیف  : " +
                                    (widget._accountDetailes.Radef.toString() ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                              "شرح  : " +
                                  (widget._accountDetailes.Sh.toString() ??
                                      '-'),
                              textDirection: TextDirection.rtl,
                              style: PersianFonts.Yekan.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              /*
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 207, 243, 4)
                  )
                  */
                            ),
                            Text(
                                "وزن  : " +
                                    (widget._accountDetailes.v_1!
                                            .toStringAsFixed(3) ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                                "عیار  : " +
                                    (widget._accountDetailes.Ayar.toString() ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                                "وزن750  : " +
                                    (widget._accountDetailes.V_750!
                                            .toStringAsFixed(3) ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                                "تعداد  : " +
                                    (widget._accountDetailes.Adad.toString() ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                            Text(
                                "مبلغ  : " +
                                    (widget._accountDetailes.reyall
                                            .toString() ??
                                        '-'),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 207, 243, 4))),
                          ],
                        ),
                      )))
            ]));
  }

//----------------------------------------------------------------------------
  Widget myCard5() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Colors.blueGrey[800],
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: const AssetImage("images/back-grey3.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3 - 20,
                  child: Center(
                    child: Text(
                      widget._accountDetailes.Name.toString(),
                      /*
                      style: TextStyle(
                        fontFamily: 'IranNastaliq.ttf',
                        fontSize: 50,
                        color: Colors.white,
                      ),*/
                      style: PersianFonts.Yekan.copyWith(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 50, bottom: 5),
                child: Text(
                  "شرح  : " + (widget._accountDetailes.Sh.toString() ?? '-'),
                  textDirection: TextDirection.rtl,
                  style: PersianFonts.Yekan.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Card(
                  elevation: 50,
                  color: Color.fromARGB(31, 247, 237, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 100,
                    child: Column(children: [
                      Container(
                        height: 30,
                        color: Colors.black12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 5,
                        color: Colors.white,
                        child: Text(
                          "شرح  : " +
                              (widget._accountDetailes.Sh.toString() ?? '-'),
                          textDirection: TextDirection.rtl,
                          style: PersianFonts.Yekan.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "فاکتور  : " +
                                (widget._accountDetailes.Factor.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "ردیف  : " +
                                (widget._accountDetailes.Radef.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "تاریخ  : " +
                                (widget._accountDetailes.tariz.toString() ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),

//--------------------------------------------------------------------------
              SizedBox(
                height: 30,
              ),
              Center(
                child: Card(
                  elevation: 50,
                  color: Color.fromARGB(31, 247, 237, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 60,
                    child: Column(children: [
                      Container(
                        height: 20,
                        //color: Colors.black12,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.auto_awesome_mosaic_rounded,
                            color: Colors.amber,
                          ),
                          Text(
                            "وزن  : " +
                                (widget._accountDetailes.v_1!
                                        .toStringAsFixed(6) ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "عیار  : " +
                                (widget._accountDetailes.Ayar!
                                        .toStringAsFixed(0) ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "وزن750  : " +
                                (widget._accountDetailes.V_750!
                                        .toStringAsFixed(6) ??
                                    '-'),
                            textDirection: TextDirection.rtl,
                            style: PersianFonts.Yekan.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
//--------------------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //-----------------------------------------------------
                    Card(
                      elevation: 50,
                      color: Color.fromARGB(31, 247, 237, 237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              //color: Colors.black12,
                            ),
                            Text(
                              "تعداد  : ",
                              textDirection: TextDirection.rtl,
                              style: PersianFonts.Yekan.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              (widget._accountDetailes.Adad.toString() ?? '-'),
                              textDirection: TextDirection.rtl,
                              style: PersianFonts.Yekan.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //------------------------------------------------------
                    Card(
                      elevation: 50,
                      color: Color.fromARGB(31, 247, 237, 237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              //color: Colors.black12,
                            ),
                            Text(
                              "مبلغ  : ",
                              textDirection: TextDirection.rtl,
                              style: PersianFonts.Yekan.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              (widget._accountDetailes.reyall.toString() ??
                                  '-'),
                              textDirection: TextDirection.rtl,
                              style: PersianFonts.Yekan.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//--------------------------------------------------------------------------
            ]));
  }
//==========================================================
// //----------------------------------------------------------------------------
//   Widget myCard6() {
//     int raghamAashar = 3;
//     return Padding(
//       padding: const EdgeInsets.only(top: 2, bottom: 1, left: 8, right: 8),
//       child: Card(
//         elevation: 10,
//         color: Colors.amber,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(3),
//           child: Container(
//               //width: MediaQuery.of(context).size.width - 50,
//               //height: MediaQuery.of(context).size.height / 5 - 20,
//               //color: Colors.blueGrey[800],
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 8,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//                 image: const DecorationImage(
//                     opacity: 1,
//                     image: const AssetImage("images/back-grey3.jpg"),
//                     fit: BoxFit.cover),
//               ),
//               child: Column(
//                   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 7),
//                         child: Text(
//                           widget._accountDetailes.Name.toString(),
//                           /*
//                           style: TextStyle(
//                             fontFamily: 'IranNastaliq.ttf',
//                             fontSize: 50,
//                             color: Colors.white,
//                           ),*/
//                           style: PersianFonts.Yekan.copyWith(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 50, bottom: 5),
//                       child: Text(
//                         "شرح  : " +
//                             (widget._accountDetailes.Sh.toString() ?? '-'),
//                         textDirection: TextDirection.rtl,
//                         style: PersianFonts.Yekan.copyWith(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Center(
//                       child: Card(
//                         elevation: 8,
//                         color: Color.fromARGB(31, 247, 237, 237),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width - 80,
//                           height: 40,
//                           child: Column(children: [
//                             Container(
//                               height: 5,
//                               color: Colors.black12,
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width - 100,
//                               height: 1,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               textDirection: TextDirection.rtl,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               //crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "فاکتور  : " +
//                                       (widget._accountDetailes.Factor
//                                               .toString() ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   "ردیف  : " +
//                                       (widget._accountDetailes.Radef
//                                               .toString() ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   "تاریخ  : " +
//                                       (widget._accountDetailes.tariz
//                                               .toString() ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             )
//                           ]),
//                         ),
//                       ),
//                     ),

//                     //--------------------------------------------------------------------------
//                     Center(
//                       child: Card(
//                         elevation: 10,
//                         color: Color.fromARGB(31, 247, 237, 237),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width - 80,
//                           height: 33,
//                           child: Column(children: [
//                             Container(
//                               height: 5,
//                               //color: Colors.black12,
//                             ),
//                             Row(
//                               textDirection: TextDirection.rtl,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               //crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.auto_awesome_mosaic_rounded,
//                                   color: Colors.amber,
//                                 ),
//                                 Text(
//                                   "وزن  : " +
//                                       (widget._accountDetailes.v_1!
//                                               .toStringAsFixed(6) ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   "عیار  : " +
//                                       (widget._accountDetailes.Ayar!
//                                               .toStringAsFixed(0) ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   "وزن750  : " +
//                                       (widget._accountDetailes.V_750!
//                                               .toStringAsFixed(6) ??
//                                           '-'),
//                                   textDirection: TextDirection.rtl,
//                                   style: PersianFonts.Yekan.copyWith(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             )
//                           ]),
//                         ),
//                       ),
//                     ),
//                     //--------------------------------------------------------------------------
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(right: 20, left: 20, top: 1),
//                       child: Row(
//                         textDirection: TextDirection.rtl,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           //--------------------------+++---------------------------
//                           Card(
//                             elevation: 10,
//                             color: Color.fromARGB(31, 247, 237, 237),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width / 2 - 80,
//                               height: 33,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: 1,
//                                     //color: Colors.black12,
//                                   ),
//                                   Text(
//                                     "تعداد  : " +
//                                         (widget._accountDetailes.Adad
//                                                 .toString() ??
//                                             '-'),
//                                     textDirection: TextDirection.rtl,
//                                     style: PersianFonts.Yekan.copyWith(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           //------------------------------------------------------
//                           Card(
//                             elevation: 50,
//                             color: Color.fromARGB(31, 247, 237, 237),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width / 2 - 80,
//                               height: 33,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: 1,
//                                     //color: Colors.black12,
//                                   ),
//                                   Text(
//                                     "مبلغ  : " +
//                                         (widget._accountDetailes.reyall
//                                                 .toString() ??
//                                             '-'),
//                                     textDirection: TextDirection.rtl,
//                                     style: PersianFonts.Yekan.copyWith(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //--------------------------------------------------------------------------
//                   ])),
//         ),
//       ),
//     );
//   }
// //==========================================================
*/