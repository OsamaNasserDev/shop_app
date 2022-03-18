import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences? sharedPreferences ;

// object from SharedPreferences
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

////////////// on boarding screen //////////////////
//
// write
  static Future<bool> writeFirstTime({required key , required value}) async {

    return await sharedPreferences!.setBool(key, value);
  }

// read
  static bool? readFirstTime({required key}){
    return sharedPreferences!.getBool(key)?? true;   // ?? Means >> if null
  }

//  token
  // write
  static Future<bool> writeToken({required value}) async {

    return await sharedPreferences!.setString("token2", value);
  }

// read
  static String readToken(){
    return sharedPreferences!.getString("token2")??"";// ?? Means >> if null
  }

  // remove
  static Future<bool> removeToken() async{
    return await sharedPreferences!.remove("token2") ;
  }



  // ///// save any data
  // // write
  // static Future<bool> saveData({required key , required value}) async {
  //
  //   if(value is String)return await sharedPreferences!.setString(key, value);
  //   if(value is bool)return await sharedPreferences!.setBool(key, value);
  //   if(value is int)return await sharedPreferences!.setInt(key, value);
  //   return await sharedPreferences!.setDouble(key, value);
  // }
  //
  // // read
  // static dynamic getData({required key})async{
  //   return  await sharedPreferences!.get(key) ;
  // }
  //
  // // remove
  // static dynamic removeData({required key})async{
  //   return await sharedPreferences!.remove(key) ;
  // }










}