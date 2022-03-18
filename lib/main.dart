import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/view.dart';
import 'package:shop_app/screens/onBoarding/views.dart';
import 'package:shop_app/screens/sign_in/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  // --------------- prefs

  // bool onBoarding = CacheHelper.readFirstTime(key: "isFirstTime")!;
  // print(onBoarding);
  // String token = CacheHelper.readToken();
  // print(token);

  // late Widget widget;
  // if (onBoarding != true) {
  //   if (token != "")
  //     widget = HomeScreen();
  //   else
  //     widget = LoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }
  runApp(MyApp(
    // startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // final Widget startWidget;
  //
  // MyApp({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0,color: Colors.white ,titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        primarySwatch: Colors.deepOrange,
      ),
      home: ScreenUtilInit(builder:() => CacheHelper.readFirstTime(key: "isFirstTime") == true ? OnBoardingScreen(): CacheHelper.readToken()!=""?HomeScreen():SignInScreen()),
    );
  }
}
