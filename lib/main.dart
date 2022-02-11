import 'package:flutter/material.dart';
import 'package:mygold/Data/Data.dart';
import 'package:mygold/LoginPage.dart';

void main() {
  runApp(const MyApp());
  //runApp(Login());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gold App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '  داگــــــلد '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget ViewModel() {
    return Card(
      child: Column(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget homeView() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 20,
        //color: Colors.grey,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: const AssetImage("images/back1.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2, bottom: 50, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: Login()),
            ],
          ),
        ),
      ),
/*      
      DecoratedBox(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              opacity: 1,
              image: const AssetImage("images/back1.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 2, left: 30, right: 30),
          child: Column(
            children: [
              Center(child: Login()),
            ],
          ),
        ),
      ),
*/
      /*  bottomNavigationBar: BottomAppBar(
        child: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TestPage()));
              },
              icon: Icon(Icons.accessibility_new_outlined)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewAccount()));
              },
              icon: Icon(Icons.account_circle_outlined)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AccountDetails(112, "418")));
              },
              icon: Icon(Icons.add_chart)),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Fetch data from server',
        child: const Icon(Icons.get_app_sharp),
      ),
      */
    );
  }
}
