import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/controller.dart';
import 'package:shop_app/screens/home/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = HomeController.get(context); // get object from cubit
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: controller.homeModel != null
                  ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount:
                                controller.homeModel?.data!.banners!.length,
                            itemBuilder: (context, index, realIdx) {
                              return ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20.0)),
                                child: Center(
                                    child: Image.network(
                                        "${controller.homeModel?.data!.banners![index].image}",
                                        fit: BoxFit.cover,
                                        width: 1000)),
                              );
                            },
                            options: CarouselOptions(
                              height: 180,
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('  Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              controller.categoriesModel?.categoriesData!.categoriesData!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.only(topRight: Radius.circular(25.0),topLeft: Radius.circular(25.0)),
                                          child: Center(
                                              child: Image.network(
                                                  "${controller.categoriesModel!.categoriesData!.categoriesData![index].image}",
                                                  fit: BoxFit.cover,
                                                 )),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(25.0)),
                                          child: Container(
                                            width: 100,
                                            color: Colors.deepOrange,
                                            child: Center(child: Text(" ${controller.categoriesModel!.categoriesData!.categoriesData![index].name}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),maxLines: 1,)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('  New Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8 ,right: 8,bottom: 8),
                            child: Container(
                              color: Colors.white,
                              child: GridView.builder(
                                physics:  const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.homeModel?.data!.products!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 1 / 1.58),
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Image.network(
                                            "${controller.homeModel?.data!.products![index].image}",
                                            //fit: BoxFit.fill,
                                            width: 1000,
                                          height: 200,
                                        ),
                                        controller.homeModel?.data!.products![index].discount != 0? Container(
                                          color: Colors.red,
                                          child: const Text("DISCOUNT",style: TextStyle(color: Colors.white)),
                                        ):Container(),
                                      ],
                                    ),
                                    Text("${controller.homeModel?.data!.products![index].name}",overflow: TextOverflow.ellipsis,maxLines: 2,style: const TextStyle(height: 1.3,fontWeight: FontWeight.bold),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("${controller.homeModel?.data!.products![index].price}",overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(height: 1.2,color: Colors.deepOrange),),
                                        const Spacer(flex: 1),
                                        Text("${controller.homeModel?.data!.products![index].oldPrice}",overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(height: 1.2,color: Colors.grey),),
                                        const Spacer(flex: 2),
                                        IconButton(onPressed: (){
                                          controller.addFavoritesProducts(controller.homeModel?.data!.products![index].id as int);
                                          }, color: controller.favorites[controller.homeModel?.data!.products![index].id] as bool ? Colors.deepOrange : Colors.grey,
                                            icon: const Icon(
                                          Icons.favorite,size: 20,
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                  )
                  : const Center(
                    child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
