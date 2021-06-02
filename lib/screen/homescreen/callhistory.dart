import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallHistory extends StatefulWidget {
  @override
  _CallHistoryState createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Remote Care  Doctor",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Color(0xFFa152ff),
            actions: <Widget>[
              // new IconButton(
              //     icon: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {}),
              // new IconButton(
              //     icon: Icon(
              //       Icons.shopping_cart,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {}),
            ],
            iconTheme: IconThemeData(color: Colors.white)),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Text("0689583281"),
                subtitle: Text("12-12-2021"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.call_made_rounded),
                onTap: () {
                  
                },
              ),
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.call),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {
               launch("tel://+255 689 583 281");
            }));
  }
}
