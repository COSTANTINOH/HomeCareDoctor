import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class TrackHistory extends StatefulWidget {
  final String phonenumber;

  TrackHistory({this.phonenumber});

  @override
  _TrackHistoryState createState() => _TrackHistoryState();
}

class _TrackHistoryState extends State<TrackHistory> {
  Future<dynamic> getPatientPage(String phone) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'phone';
    // final value = prefs.get(key) ?? 0;

    String myApi = "http://192.168.43.195/homecare/api/getbpm.php";
    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "user_id": "$phone",
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        var json = jsonDecode(response.body);
        print(json);
        return json;
      } else if (jsonResponse == 404) {
      } else if (jsonResponse == 500) {}
    } else {
      print("no data");
    }
  }

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
            actions: <Widget>[],
            iconTheme: IconThemeData(color: Colors.white)),
        body: FutureBuilder(
          future: getPatientPage(widget.phonenumber),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print("myrede ${snapshot.data}");
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Text("BPM : ${snapshot.data[index]['bpm']}"),
                        subtitle: Text("${snapshot.data[index]['dates']}"),
                        trailing: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No Data Found'),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
