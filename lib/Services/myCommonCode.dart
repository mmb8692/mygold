import 'package:flutter/material.dart';

class MyCommon {
  //static var mediaWidth = MediaQuery.of(Application).size.width
  //static var mediaHeight =MediaQuery.of(context).size.height

  //-------------------------------------------------------
  static void myShowDialog(String title, String text, BuildContext context) {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.right,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          content: Container(
              width:
                  400, //double.infinity, //MediaQuery.of(context).size.width,
              height:
                  150, //double.infinity, //MediaQuery.of(context).size.height,
              /*
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(1),
                //color: Colors.amber[900],
              ),
              */
              child: Center(
                  child: Text(
                text,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ))),
          titleTextStyle: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
          contentTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            // usually buttons at the bottom of the dialog

            Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.amber[900],
                  ),
                  child: Center(
                    child: Text(
                      "بستن",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
  //-------------------------------------------------------

//-------------------------------------------------------

//-------------------------------------------------------

//-------------------------------------------------------
}
