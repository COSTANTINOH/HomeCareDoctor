import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CallHistory extends StatefulWidget {
  final String phonenumber;

  CallHistory({this.phonenumber});

  @override
  _CallHistoryState createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  var mydoctor;

  @override
  void initState() {
    getdoctordata();
    super.initState();
  }

  Future<dynamic> getdoctordata() async {
    print("inside");
    final prefs = await SharedPreferences.getInstance();
    final key = 'doctor_id';
    final value = prefs.get(key) ?? 0;

    String myApi = "http://192.168.43.195/homecare/api/get_doctor_phone.php";
    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "doctor_id": "${widget.phonenumber}",
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        var json = jsonDecode(response.body);
        print("doctor number ${json[0]['phone']}");
        mydoctor = json[0]['phone'];
        print(json);
        return json;
      } else if (jsonResponse == 404) {
      } else if (jsonResponse == 500) {}
    } else {
      print("no data");
    }
  }

  Future<dynamic> sendCallHistory(
      String doctor_phone, String patient_id) async {
    String myApi = "http://192.168.43.195/homecare/api/call_history.php/";

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd - kk:mm');
    String formattedDate = formatter.format(now);

    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "doctor_phone": "$doctor_phone",
      "call_date": "$formattedDate",
      "patient_id": "$patient_id",
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        var json = jsonDecode(response.body);
        return Fluttertoast.showToast(
            msg: "Data Sent Successfully Created",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else if (jsonResponse == 404) {
        return Fluttertoast.showToast(
            msg: "Phone Number Already Registered",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else if (jsonResponse == 500) {
        return Fluttertoast.showToast(
            msg: "Server Error Please Try Again Later",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } else {
      print("no data");
    }
  }

  Future<dynamic> getPatientPage(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'phone';
    final value = prefs.get(key) ?? 0;

    String myApi = "http://192.168.43.195/homecare/api/getcall.php";
    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "patient_id": "$value",
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
                      title: Text("${snapshot.data[index]['doctor_phone']}"),
                      subtitle: Text("${snapshot.data[index]['call_date']}"),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.call_made_rounded),
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        final key = 'phone';
                        final value = prefs.get(key) ?? 0;

                        sendCallHistory(mydoctor, value);

                        launch("tel://$mydoctor");
                      },
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
      // floatingActionButton: new FloatingActionButton(
      //   elevation: 0.0,
      //   child: new Icon(Icons.call),
      //   backgroundColor: new Color(0xFFE57373),
      //   onPressed: () async {
      //     final prefs = await SharedPreferences.getInstance();
      //     final key = 'phone';
      //     final value = prefs.get(key) ?? 0;

      //     sendCallHistory(mydoctor, value);

      //     launch("tel://$mydoctor");
      //   },
      // ),
    );
  }
}
