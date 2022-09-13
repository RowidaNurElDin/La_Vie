import 'package:flutter/cupertino.dart';
import 'package:la_vie/Models/login_signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CacheHelper{
  static late SharedPreferences sharedPreferences ;


  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }



  static LoginModel? loginModel ;


  static String getString(String key, [String? defValue]) {
    return sharedPreferences.getString(key) ?? defValue ?? "";
  }



  static dynamic getData({required String key}){
    return sharedPreferences.get(key);
  }


  static Future<bool> saveData({
  required String key,
    required dynamic value}) async{

    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is int) return await sharedPreferences.setInt(key, value);
    if(value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);


  }


}