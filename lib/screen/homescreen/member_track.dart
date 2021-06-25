import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realEstate/screen/auth/shared.dart';
import 'package:realEstate/screen/homescreen/track_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberTrack extends StatefulWidget {
  @override
  _MemberTrackState createState() => _MemberTrackState();
}

class _MemberTrackState extends State<MemberTrack> {
  @override
  // ignore: override_on_non_overriding_member
  Future<dynamic> getMemberTrack() async {
    // print(_cargono);
    // print(_cphone);
    final prefs = await SharedPreferences.getInstance();
    final key = 'doctor_id';
    final value = prefs.get(key) ?? 0;
    String myApi = "http://192.168.43.195/homecare/api/getmypatient.php";
    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "doctor_id": "$value",
    });

    print("get patient of doctor id $value");

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

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMemberTrack(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(snapshot.data);
                return ListTile(
                  onTap: () => {},
                  onLongPress: () => {},
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  title: Text(
                    "${snapshot.data[index]['fname']}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${snapshot.data[index]['phone']}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackHistory(
                                  phonenumber: snapshot.data[index]['phone'],
                                )),
                      );
                    },
                    child: Text('View'),
                    style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No Patient Found'),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
