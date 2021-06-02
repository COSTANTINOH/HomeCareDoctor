import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realEstate/screen/auth/login.dart';
import 'package:realEstate/screen/homescreen/about_app.dart';
import 'package:realEstate/screen/homescreen/articles.dart';
import 'package:realEstate/screen/homescreen/landpage.dart';
import 'package:realEstate/screen/homescreen/patient.dart';
import 'package:realEstate/screen/homescreen/profile.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // ignore: missing_return
  Widget _activeWidget(int index) {
    switch (index) {
      case 0:
        // Home
        return LandPage();
        break;
      case 1:
        // post
        return ArticlesPage();
        break;
      case 2:
        // members
        return PatientPage();
      case 3:
        // members
        return Center(child: Text("Track Not Done Yet"));
        break;
      case 4:
        // profile
        return Profile();
        break;

      default:
        // Defaults to home

        break;
    }
  }

  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(
        Icon(Icons.new_releases), Text('Articles'), Colors.pinkAccent),
     NavigationItem(
        Icon(Icons.person), Text('Patients'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.trending_up_rounded), Text('Monitor'), Colors.amberAccent),
    NavigationItem(
        Icon(Icons.person_outline), Text('Profile'), Colors.cyanAccent)
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black,
                ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildnavigation(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
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
      bottomNavigationBar: buildnavigation(context),
      body: _activeWidget(selectedIndex),
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFa152ff),
              ),
              accountName: Text(
                'HomeCARE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              accountEmail: Text(
                'your health is our priority',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              otherAccountsPictures: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 36.0,
                    ),
                    onPressed: () {
                      //Navigator//
                    })
              ],
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/home_logo.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(
                    color: Color(0xFFa152ff),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
              },
            ),
            // ListTile(
            //     leading: Icon(Icons.call),
            //     title: Text(
            //       "Contact Us",
            //       style: TextStyle(
            //           color: Color(0xFFa152ff),
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'Raleway'),
            //     ),
            //     onTap: () {
            //       //Navigator//
            //     }),
            ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  "About App",
                  style: TextStyle(
                      color: Color(0xFFa152ff),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutApp()),
                  );
                }),
            ListTile(
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  return Fluttertoast.showToast(
                      msg: "See you next time",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white);
              },
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Logout",
                style: TextStyle(
                    color: Color(0xFFa152ff),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);
}
