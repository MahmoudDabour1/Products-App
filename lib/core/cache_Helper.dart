import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
     prefs = await SharedPreferences.getInstance();
  }

  static Future<bool>saveCounter(int count) async {
    return await prefs.setInt("counter", count);
  }

  static int getCounter()  {
    return prefs.getInt("counter") ?? 0;
  }

  static Future<bool>saveIfNotFirstTime() async {
    return await prefs.setBool("isFirstTime", false);
  }

  static bool getIfFirstTime()  {
    return prefs.getBool("isFirstTime") ?? true;
  }

  static Future<bool>saveToken(String token) async {
    return await prefs.setString("token", token);
  }

  static String getToken()  {
    return prefs.getString("token") ?? "";
  }

  static Future<bool>saveImage(String imageUrl) async {
    return await prefs.setString("image",imageUrl );
  }

  static String getImage()  {
    return prefs.getString("image") ?? "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhC9Mihm_tYHYJ-I6Fk-c28oxeaMqBAjnor8re2MtEGUNrXMMpeCVrV-RwsifiRvRbGvAGqzhVzvmGAGzF7dNqpE-lPn2Yw1ffMeW_pmID3RLIU_kpz7nr8dDg3R_egBsvRmjlrob3AVEXWmdeay-GkSfUOeNkEsrG6Sxeqq2Crah9Nj5gmWye_B17l/w358-h400/%D8%B5%D9%88%D8%B1-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D8%B1%D8%A7%D8%A6%D8%B9%D8%A9-%D8%AA%D8%AD%D9%81%D8%A9%20(3).jpg";
  }

  static Future<bool>saveName(String name) async {
    return await prefs.setString("name", name);
  }

  static String getName()  {
    return prefs.getString("name") ?? "Mahmoud Dabour";
  }

  static Future<bool>saveFullName(String name) async {
    return await prefs.setString("Full_Name", name);
  }

  static String getFullName()  {
    return prefs.getString("Full_Name") ?? "Mahmoud Dabour";
  }

  static Future<bool>saveEmail(String email) async {
    return await prefs.setString("Email", email);
  }

  static String getEmail()  {
    return prefs.getString("Email") ?? "mahmoud.dabour1000000@gmail.com";
  }

  static Future<bool>savePhone(String phone) async {
    return await prefs.setString("phone", phone);
  }

  static String getPhone()  {
    return prefs.getString("phone") ?? "01099101469";
  }

  static Future<bool>saveId(int id) async {
    return await prefs.setInt("id", id);
  }

  static int getId()  {
    return prefs.getInt("id") ?? 0;
  }

  static Future<bool> clear(){
    return prefs.clear();
  }
}
