

import 'package:shared_preferences/shared_preferences.dart';
var prefs;
getpref() async {
  prefs = await SharedPreferences.getInstance();
}

class DataService {

  static var data = [];

}

