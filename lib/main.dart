import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageChanger(),
      // or //page2,
    );
  }
}

// // FEATURES--------------------------------
// 1. drawer to switch pages
// 2. Live Page -> can hide/unhide the list of people
//                 can scroll to view all people
//                 Flexible Comment Box
// 3.  Accounts Page ->  can toggle between viewall/viewless
//                       a different class using transaction details
//                       Flexible Transaction Card Box


class PageChanger extends StatefulWidget {
  @override
  _PageChangerState createState() => _PageChangerState();
}

class _PageChangerState extends State<PageChanger> {
  Widget defPage = AccountsPage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

      // Drawer to change Pages ------
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Text(
                  'Goto Page',
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Live Page'),
                onTap: () {
                  setState(() {
                    defPage = LivePage();
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                title: Text('Accounts Page'),
                onTap: () {
                  setState(() {
                    defPage = AccountsPage();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),

      // Changing Pages  =with this var ------------
        body: defPage,
      ),
    );
  }
}
