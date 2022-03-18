
import 'package:flutter/material.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/screens/sign_in/view.dart';

void NavigatorTo(context , Widget Screen)  {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen,));
}


navigateToAndR(context,page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page,), (route) => false);
}


void signOut(context){
  CacheHelper.removeToken().then(
          (value)async{
             print("${CacheHelper.removeToken()}");
             print("${value}");
             await navigateToAndR(context, SignInScreen());}
    );
}