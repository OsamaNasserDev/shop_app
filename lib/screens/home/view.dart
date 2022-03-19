import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/methods.dart';
import 'package:shop_app/component/showMotionToast.dart';
import 'package:shop_app/screens/home/controller.dart';
import 'package:shop_app/screens/home/search/view.dart';
import 'package:shop_app/screens/home/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController()..getFavoritesData()..getHomeData()..getCategoriesData()..getProfileDataModel(),
      child: BlocConsumer<HomeController, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {


          final controller = HomeController.get(
              context); // get object from cubit
          return Scaffold(
            appBar: AppBar(title: Text("Shop App"),
            actions: [IconButton(onPressed:(){NavigatorTo(context ,SearchScreen());} ,icon:  Icon(Icons.search,color: Colors.deepOrange,))],),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                child: controller.currentPage[controller.currentBottomIndex]
            ),
            bottomNavigationBar: Padding(
              padding:  EdgeInsets.only(left: 10 ,right: 10 ,bottom: 14),
              child: Container(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(18.0), bottomRight: Radius.circular(18.0),topLeft:Radius.circular(8.0),topRight: Radius.circular(8.0)  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.deepOrange,
                    selectedIconTheme: IconThemeData(color: Colors.white),
                    unselectedIconTheme:  IconThemeData(color: Colors.white54),
                    selectedItemColor:  Colors.white ,
                    unselectedItemColor:  Colors.white54,

                    currentIndex: controller.currentBottomIndex,
                    onTap: (index) {
                      controller.ChangeBottomNavBarIndex(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home,),
                        label: 'Products',
                      ),

                      BottomNavigationBarItem(
                        icon: Icon(Icons.apps ),
                        label: 'Categories',
                      ),

                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite ),
                        label: 'Favorites',
                      ),

                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
