import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Future<dynamic> getArticlesPage() async {
    // print(_cargono);
    // print(_cphone);
    String myApi = "http://192.168.43.195/homecare/api/getpost.php";
    //tosh90.000webhostapp.com
    final response =
        await http.post(myApi, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        var json = jsonDecode(response.body);
        print(json);
        return json;
      } else if (jsonResponse == 404) {
        // setState(() {
        //   isSearching = false;
        // });
      } else if (jsonResponse == 500) {
        // setState(() {
        //   isSearching = false;
        // });
      }
    } else {
      print("no data");
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArticlesPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(snapshot.data);
                return Card(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("${snapshot.data[index]['title']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              )),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 70, // default\minimum height
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  '${snapshot.data[index]['description']}',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              )
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                           Text(
                                'Post Date : ${snapshot.data[index]['post_date']}', 
                                style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                                //some other text in the end of the card or maybe an icon instead
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No Member Found'),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
