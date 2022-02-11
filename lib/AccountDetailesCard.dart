import 'package:flutter/material.dart';
import 'package:mygold/Models/Models.dart';
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
                          style: TextStyle(
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
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 25, top: 0, bottom: 0),
                      child: showFiledSharh(
                        'شرح :',
                        (widget._accountDetailes.Sh),
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
          style: TextStyle(
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
          style: TextStyle(
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
          style: TextStyle(
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
            style: TextStyle(
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
