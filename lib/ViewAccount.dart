import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mygold/AccountCard.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/Models/Models.dart';
import 'package:mygold/Services/ServerRequest.dart';

class ViewAccount extends StatefulWidget {
  ViewAccount({Key? key}) : super(key: key);

  @override
  _ViewAccountState createState() => _ViewAccountState();
}

class _ViewAccountState extends State<ViewAccount> {
  late List<Bank1_min> _viewAccountList = [];
  TextEditingController searchControler = TextEditingController();
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FillAccountList();
    //_viewAccountList = AccountData.accountList;
    _viewAccountList.insertAll(0, AccountData.accountList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 50,
            leading: IconButton(
              icon: ImageIcon(
                AssetImage("images/close.png"),
                //color: Color.fromARGB(255, 233, 8, 214),
              ),
              //const Icon(Icons.keyboard_double_arrow_left_rounded), //Icons.arrow_back_ios_new),
              onPressed: () {
                exit(0);
              },
            ),
            title: const Align(
              child: const Text(
                'داگــــلد',
                style: TextStyle(fontSize: 27),
              ),
              alignment: Alignment.bottomRight,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: SearchBar(),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          const SliverToBoxAdapter(
              //child: SizedBox(
              //height: 20,
              //child: Center(
              //  child: Text('Scroll to see the SliverAppBar in effect.'),
              // ),
              // ),
              ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildRow(index);
              },
              childCount: _viewAccountList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print(ApiResponseData.data);
          //Navigator.of(context).pop();
          exit(0);
        },
        child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
/*
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      */
    );

    /*
    Scaffold(
      appBar: AppBar(
        //title: Center(child: Text('داگــــلد')),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        //backgroundColor: Colors.blueGrey[900],

//==============================================================

        title: SearchBar(),
//==============================================================
      ),
      body: ListView.builder(
        itemCount: AccountData.accountList.length,
        //padding: const EdgeInsets.all(6),
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print(ApiResponseData.data);
          //Navigator.of(context).pop();
          exit(0);
        },
        child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    */
  }

  Widget _buildRow(int index) {
    return Container(
      //width: 100,
      height: 180,
      color: Colors.amber[400],

      child: AccountCard(_viewAccountList[index]),
    );
  }

  void FillAccountList() {
    //print("Salammmmmmmmmmmmmmmmmmm");
    var decodedData = json.decode(ApiResponseData.data);
    print("\n************** **************************");
    print(
        "\n************** ApiResponseData.data : ${ApiResponseData.data} **************************");

    print(
        "\n**************   decodedData : $decodedData **************************");

    print("************** **************************");

    ///print("decodecData.length = ${decodedData.length}");
/*
    for (int i = 0; i < decodedData.length; i++) {
      decodedData[i].forEach((key, value) => FileBank_1(key, value));
    }
*/
    //print("cod is:${decodedData[0]}");
    for (var item in decodedData) {
      Bank1_min account = Bank1_min();
      item.forEach((key, value) => FileBank_1(account, key, value));
      AccountData.accountList.add(account);
    }
/*
    print(
        "AccountData.accountList.last.cod = ${AccountData.accountList.last.cod}");

    print("AccountData.accountList.length = ${AccountData.accountList.length}");
    print(
        "AccountData.accountList.last.name = ${AccountData.accountList.last.name}");
    print(
        "AccountData.accountList.last.cod = ${AccountData.accountList.last.cod}");
    print(
        "AccountData.accountList.last.factor = ${AccountData.accountList.last.factor}");
    print(
        "AccountData.accountList.last.tariz = ${AccountData.accountList.last.tariz}");
    print(
        "AccountData.accountList.last.officeName = ${AccountData.accountList.last.officeName}");
    print(
        "AccountData.accountList.last.officeId = ${AccountData.accountList.last.officeId}");
    print(
        "AccountData.accountList.last.r_bed = ${AccountData.accountList.last.r_bed}");
    print(
        "AccountData.accountList.last.r_bes = ${AccountData.accountList.last.r_bes}");
    print(
        "AccountData.accountList.last.v_bed = ${AccountData.accountList.last.v_bed}");
    print(
        "AccountData.accountList.last.v_bes = ${AccountData.accountList.last.v_bes}");
  */
  }

  void FileBank_1(Bank1_min account, var key, var value) {
    key == 'cod' ? account.cod = value : {};
    key == 'name' ? account.name = value : {};
    key == 'factor' ? account.factor = value : {};
    key == 'officeName' ? account.officeName = value : {};
    key == 'officeId' ? account.officeId = value : {};
    key == 'r_bed' ? account.r_bed = value : {};
    key == 'r_bes' ? account.r_bes = value : {};
    key == 'v_bed' ? account.v_bed = value : {};
    key == 'v_bes' ? account.v_bes = value : {};
    key == 'v_bes' ? account.v_bes = value : {};
    key == 'tariz' ? account.tariz = value : {};
  }

//=============================================================

  Widget SearchBar() {
    return Container(
      width: 180, // double.infinity,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        alignment: FractionalOffset.center,
        //child: DecoratedBox(
        //decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(5),
        //border: Border.all(
        //  color: Colors.blue,
        //  width: 4,
        // ),
        //),
        child: Center(
          child: TextField(
            controller: searchControler,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
                prefixIcon: InkWell(
                  child: Icon(Icons.search),
                  onTap: (() {
                    setState(() {
                      _viewAccountList.clear();
                      _viewAccountList.insertAll(
                          0, searchResult(searchControler.text));
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      //currentFocus.unfocus();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    });
                  }),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.clear_outlined),
                  onTap: (() {
                    setState(() {
                      searchControler.text = '';
                      _viewAccountList.clear();
                      _viewAccountList.insertAll(0, AccountData.accountList);
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      //currentFocus.unfocus();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    });
                  }),
                ),
                /*
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                */
                hintText: 'جستجوی نام',
                alignLabelWithHint: true,
                hintTextDirection: TextDirection.rtl,
                border: InputBorder.none),
            onChanged: (text) {
              print("First text field: $text");
              setState(() {
                _viewAccountList.clear();
                _viewAccountList.insertAll(
                    0, searchResult(searchControler.text));
              });
            },
          ),
        ),
      ),
    );
  }

//-------------------------------------------------------------
  List<Bank1_min> searchResult(String txt) {
    var list =
        AccountData.accountList.where((element) => element.name!.contains(txt));
    List<Bank1_min> result = [];
    result.addAll(list);
    return result;
  }
  //-----------------------------------------------------------

//=============================================================

}
