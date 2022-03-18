import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/controller.dart';
import 'package:shop_app/screens/home/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = HomeController.get(context); // get object from cubit
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemCount: controller
                      .categoriesModel?.categoriesData!.categoriesData!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ListTile(
                          title: Text(
                            " ${controller.categoriesModel!.categoriesData!.categoriesData![index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            maxLines: 1,
                          ),
                          leading: SizedBox(
                            height: 100.0,
                            width: 100.0, // fixed width and height
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25.0),
                                  topLeft: Radius.circular(25.0)),
                              child: Center(
                                  child: Image.network(
                                "${controller.categoriesModel!.categoriesData!.categoriesData![index].image}",
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
