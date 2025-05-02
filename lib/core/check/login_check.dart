import 'package:shared_preferences/shared_preferences.dart';

class LoginCheck{

  static Future <void> saveLoginStatus(bool value)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }
  static Future<bool> checkLoginStatus()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}