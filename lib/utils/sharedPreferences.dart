import 'package:shared_preferences/shared_preferences.dart';

class CaloriePreferences {


  void sharedPrefInit() async {
    try {
      /// Checks if shared preference exist
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.getString("app-name");
    } catch (err) {
      /// setMockInitialValues initiates shared preference
      /// Adds app-name
      SharedPreferences.setMockInitialValues({});
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.setString("app-name", "my-app");
    }
  }

  static dynamic putString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setString("$key", val);
    return _res;
  }

  static dynamic getString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String _res = prefs.getString("$key");
    return _res;
  }

  static checkingTheSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('nama');
    return username;
  }


}