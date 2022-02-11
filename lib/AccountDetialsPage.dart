//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart' as intl;
import 'package:mygold/AccountDetailesCard.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/Models/Models.dart';

class AccountDetails extends StatefulWidget {
  final double code;
  final String officeId;
  const AccountDetails(this.code, this.officeId, {Key? key})
      : super(
          key: key,
        );

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  late List<Bank3_min> _accountDetailsList = [];
  TextEditingController nameSearchControler = TextEditingController();
  TextEditingController factorSearchControler = TextEditingController();
  TextEditingController shSearchControler = TextEditingController();
  TextEditingController tarizSearchControler = TextEditingController();
  TextEditingController az_SearchControler = TextEditingController();
  TextEditingController ta_SearchControler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountDetailsList.addAll(AccountData.accountDetailsList);

    //getAccountDetials(widget.code, widget.officeId);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Center(child: Text('تراکنشها')),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      endDrawer: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(width: 250, height: 300, child: DetailsDrawer2())),
      //Align(alignment: FractionalOffset.bottomCenter, child: DrawerTest()),
      //Drawer(child: DetailsDrawer()),

      /*Card(
        elevation: 5,
        child: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: DrawerHeader(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '',
                      //"جستجو .......",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        opacity: 1,
                        image: const AssetImage('images/back12.jpg'),
                        fit: BoxFit.fill),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
              Expanded(
                child: DetailsDrawer(),
              ),
            ],
          ),
        ),
        
      ),
      */
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              //image: const AssetImage("images/Golden_Background1.jpg"),
              image: const AssetImage("images/Grey-Background.jpg"),
              fit: BoxFit.fill),
        ),
        child: ListView.builder(
          itemCount: _accountDetailsList.length,
          //physics: FixedExtentScrollPhysics(),
          //padding: const EdgeInsets.all(6),
          itemBuilder: (BuildContext context, int index) {
            return _buildRow(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        //backgroundColor: Colors.deepOrange,
        backgroundColor: Colors.blueGrey[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildRow(int index) {
    //return AccountDetailesCard(AccountData.accountDetailsList[index]);

    return Container(
      child: AccountDetailesCard(_accountDetailsList[index]),
    );
  }

//==============================================================================
  Widget DetailsDrawer() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: const DecorationImage(
          opacity: 1,
          image: AssetImage("images/back-grey1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: (ListView(
        children: [
          DrawerHeader(
              child: Image(
            image: AssetImage('images/back12.jpg'),
            fit: BoxFit.cover,
          )),
          ListTile(
              //tileColor: Colors.brown, //tileColor: Colors.purpleAccent[400],
              title: Search(nameSearchControler, 'Name')),
          ListTile(
            style: ListTileStyle.drawer,
            //tileColor: Colors.brown, //tileColor: Colors.purple[300],
            title: Search(factorSearchControler, 'Factor'),
          ),
          ListTile(
            //tileColor: Colors.brown, //tileColor: Colors.deepPurple[300],
            title: Search(tarizSearchControler, 'Radef'),
          ),
          ListTile(
            //tileColor: Colors.brown, //tileColor: Colors.deepOrange[300],
            title: Search(shSearchControler, 'Sh'),
          ),
          ListTile(
            //tileColor: Colors.brown, //tileColor: Colors.amber[600],
            title: Search(tarizSearchControler, 'tariz'),
          ),
          ListTile(
            //tileColor: Colors.brown, //
            title: SearchRange(az_SearchControler, ta_SearchControler, 'tariz'),
          ),
        ],
      )),
    );
    /*
    (Container(
      width: double.infinity,
      height: double.maxFinite, //MediaQuery.of(context).size.height,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: AssetImage("images/back8.jpg"),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 5),
          child: Scrollbar(
            isAlwaysShown: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Search(nameSearchControler, 'Name'),
                Search(factorSearchControler, 'Factor'),
                Search(tarizSearchControler, 'Radef'),
                Search(shSearchControler, 'Sh'),
                Search(tarizSearchControler, 'tariz'),
                SearchRange(az_SearchControler, ta_SearchControler, 'tariz'),
              ],
            ),
          ),
        ),
      ),
    ));
    */
  }

//-------------------------------------------------------------
  Widget DetailsDrawer2() {
    return DecoratedBox(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            opacity: 1,
            image: AssetImage("images/back5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: 0,
              child: DrawerHeader(
                  child: Image(
                image: AssetImage('images/back12.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(

                //tileColor: Colors.brown, //tileColor: Colors.purpleAccent[400],
                title: Search(nameSearchControler, 'Name')),
            ListTile(
              style: ListTileStyle.drawer,
              //tileColor: Colors.brown, //tileColor: Colors.purple[300],
              title: Search(factorSearchControler, 'Factor'),
            ),
            ListTile(
              //tileColor: Colors.brown, //tileColor: Colors.deepPurple[300],
              title: Search(tarizSearchControler, 'Radef'),
            ),
            ListTile(
              //tileColor: Colors.brown, //tileColor: Colors.deepOrange[300],
              title: Search(shSearchControler, 'Sh'),
            ),
            ListTile(
              //tileColor: Colors.brown, //tileColor: Colors.amber[600],
              title: Search(tarizSearchControler, 'tariz'),
            ),
            ListTile(
              //tileColor: Colors.brown, //
              title:
                  SearchRange(az_SearchControler, ta_SearchControler, 'tariz'),
            ),
          ],
        ));
  }

//-------------------------------------------------------------
  Widget Search(TextEditingController controler, String onvan) {
    return Container(
      width: double.infinity, // double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        alignment: FractionalOffset.center,
        // child: DecoratedBox(
        // decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        // border: Border.all(
        //  color: Colors.blue,
        //  width: 4,
        // ),
        // ),
        child: TextField(
          controller: controler,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
              prefixIcon: InkWell(
                child: Icon(
                  Icons.search,
                  size: 15,
                ),
                onTap: (() {
                  setState(() {
                    _accountDetailsList.clear();
                    _accountDetailsList
                        .addAll(searchResult(onvan, controler.text));
                  });
                }),
              ),
              suffixIcon: InkWell(
                child: Icon(
                  Icons.clear_outlined,
                  size: 15,
                ),
                onTap: (() {
                  setState(() {
                    controler.text = '';
                    _accountDetailsList.clear();
                    _accountDetailsList.addAll(AccountData.accountDetailsList);
                    // _viewAccountList= AccountData.accountList;
                  });
                }),
              ),
              hintText: 'جستجوی : ' + ShowOnvan(onvan),
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              border: InputBorder.none),
          onChanged: (text) {
            //print("First text field: $text");
            setState(() {
              _accountDetailsList.clear();
              _accountDetailsList.addAll(searchResult(onvan, controler.text));
            });
          },
        ),
      ),
    );
  }

//-------------------------------------------------------------
//-------------------------------------------------------------
  Widget SearchRange(TextEditingController azControler,
      TextEditingController taControler, String onvan) {
    return Container(
      //width: double.infinity,
      //height: 150, //double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
      child: FractionallySizedBox(
        //widthFactor: 0.45,
        //heightFactor: 0.45,
        alignment: FractionalOffset.center,
        child: Center(
          child: Container(
            //color: Colors.red,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'از',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: azControler,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  //keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    //fillColor: Colors.blue,
                    hintTextDirection: TextDirection.rtl,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // labelText: onvan,
                    // labelStyle: TextStyle(
                    //   color: Colors.white,
                    // ),
                    hintText: ShowOnvan(onvan),
                    hintStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                    // icon: Icon(
                    //   Icons.search,
                    //   color: Colors.amber,
                    //   size: 25,
                    // )
                  ),
                  onChanged: (text) {
                    //print("First text field: $text");
                    setState(() {
                      _accountDetailsList.clear();
                      _accountDetailsList.addAll(searchRangeResult(
                          onvan, azControler.text, taControler.text));
                    });
                  },
                ),

//=================================================
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'تا',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: taControler,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white),
                  //keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    //fillColor: Colors.blue,
                    hintTextDirection: TextDirection.rtl,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // labelText: onvan,
                    // labelStyle: TextStyle(
                    //   color: Colors.white,
                    // ),
                    hintText: ShowOnvan(onvan),
                    hintStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                    // icon: Icon(
                    //   Icons.search,
                    //   color: Colors.amber,
                    //   size: 25,
                    // )
                  ),
                  onChanged: (text) {
                    //print("First text field: $text");
                    setState(() {
                      _accountDetailsList.clear();
                      _accountDetailsList.addAll(searchRangeResult(
                          onvan, azControler.text, taControler.text));
                    });
                  },
                ),
//=================================================
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    color: Colors.transparent,
                    child: Container(
                      width: 100,
                      height: 35,
                      ////color: Colors.amber,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20)), //.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //print("First text field: $text");
                          setState(() {
                            _accountDetailsList.clear();
                            _accountDetailsList.addAll(searchRangeResult(
                                onvan, azControler.text, taControler.text));
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//-------------------------------------------------------------
  List<Bank3_min> searchResult(String onvan, String txt) {
    var list;
    switch (onvan) {
      case 'Name':
        list = AccountData.accountDetailsList
            .where((element) => element.Name!.contains(txt));
        break;
      case 'Sh':
        list = AccountData.accountDetailsList
            .where((element) => element.Sh.contains(txt));
        break;
      case 'Factor':
        list = AccountData.accountDetailsList
            .where((element) => element.Factor!.contains(txt));
        break;
      case 'tariz':
        list = AccountData.accountDetailsList
            .where((element) => element.tariz!.contains(txt));
        break;
      case 'Radef':
        list = AccountData.accountDetailsList
            .where((element) => element.Radef.toString().contains(txt));
        break;
      default:
    }

    List<Bank3_min> result = [];
    result.addAll(list);
    return result;
  }

  //-----------------------------------------------------------
  List<Bank3_min> searchRangeResult(
      String onvan, String? azText, String? taText) {
    var list;
    if (taText!.isEmpty)
      list = AccountData.accountDetailsList
          .where((element) => element.tariz!.compareTo(azText!) >= 0);
    else if (azText!.isEmpty)
      list = AccountData.accountDetailsList
          .where((element) => element.tariz!.compareTo(taText) <= 0);
    else
      list = AccountData.accountDetailsList.where((element) =>
          element.tariz!.compareTo(azText) >= 0 &&
          element.tariz!.compareTo(taText) <= 0);

    List<Bank3_min> result = [];
    result.addAll(list);
    return result;
  }

  //-----------------------------------------------------------
  String ShowOnvan(String onvan) {
    String result = '';
    switch (onvan) {
      case 'Name':
        result = 'نام';
        break;
      case 'Sh':
        result = 'شرح';
        break;
      case 'Factor':
        result = 'فاکتور';
        break;
      case 'tariz':
        result = 'تاریخ';
        break;
      case 'Radef':
        result = 'ردیف';
        break;

      default:
        result = onvan;
    }
    return result;
  } //-----------------------------------------------------------
//==============================================================================

  Widget DrawerTest() {
    return (Drawer(
        elevation: 1.5,
        child: Container(
          width: 100,
          height: 100,
          child: Column(children: [
            DrawerHeader(
                child: null,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                )),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('My Cart'),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('My Orders'),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {})
              ],
            )),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 0.1,
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: 100,
                child: Text(
                  "V1.0.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ]),
        )));
  }
}
