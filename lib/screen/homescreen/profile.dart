
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realEstate/screen/homescreen/callhistory.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CallHistory()),
                  );
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.phone
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepPurple[800],Colors.deepPurpleAccent],)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[800],Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 110.0,),
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage('assets/images/avatar.png'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10.0,),
                        Text('Jackson Joseph',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20.0,
                        )),
                        SizedBox(height: 10.0,),
                        Text('Patient',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 15.0,
                        ),)
                    ]
                    ),
                  ),
            ),
            

         Container(
                  color: Colors.grey[200],
                  child: Center(
                      child:Card(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 310.0,
                          height:290.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                ),),
                                Divider(color: Colors.grey[300],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Phone Number",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("+255 689 583 281",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.map,
                                      color: Colors.yellowAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Location",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Sinza",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                  )    
          ],
        ),
      )
    );
  }
}