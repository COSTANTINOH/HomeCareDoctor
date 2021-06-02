import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("About App",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          )),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'The worldwide population has increased significantly which is largely due to the advancement in medicine while the number of elderlies who need more care is increasing. According to the national of bureau statistics in 2012 it showed that the total number of elderly age group (60+) is 4,149,382 where proximately 80% of this population have at least one chronic disease and 77% have at least two chronic diseases, and healthcare costs are continuously rising and the quality of the service does not meet the need of modern society. As the result the diagnostics are delayed or some patients are ignored (finance, 2012). Due to this, healthcare systems have started implementing advanced technologies for maintaining each and every patient. Unfortunately, many health problems are getting undetected in the healthcare system. Today sudden death of elderly due to chronic diseases (cancer, heart diseases, diabetes and stroke and asthma). to address this problem technology is promising to personalize the use of smart sensor which are able to collect real time information of and send the danger sign to respective caretaker. This proposed project is expected to overcome these challenges by detecting the danger signs using the designed sensors which will be measuring patient vitals and direct send the data to the doctor. ',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                            height: 30,
                          ),
                       Row(
                        children: <Widget>[
                          SizedBox(
                            height: 70, // default\minimum height
                          ),
                          Expanded(
                            child: Text(
                              'In this proposed project (REMOTE HOME CARE) the vital parameters such as temperature and heart beat readings will be monitored using smart sensor. Here patients body temperature, fall detection and heart rate is measured using respective sensors and it can be monitored in the screen of computer using micro controller connected to a cloud database system, this will be monitored anywhere in the specific area using internet source, then automatically sends data to the receiver system. Hence, it enables continuous monitoring of the patient’s health parameters by the doctor. Any abrupt increase or decrease in these parameter values can be detected at the earliest and hence necessary medications can be implemented by the doctor immediately either by sending medical advice or reaching the patient physically.',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
