import 'package:flutter/material.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/view.dart';
import 'package:shop_app/screens/onBoarding/views.dart';
import 'package:shop_app/screens/sign_in/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  runApp(MyApp(
    // startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

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
      home: CacheHelper.readFirstTime(key: "isFirstTime") == true ? OnBoardingScreen(): CacheHelper.readToken()!=""?HomeScreen():SignInScreen(),
    );
  }
}
