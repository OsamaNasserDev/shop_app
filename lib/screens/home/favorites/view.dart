import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/controller.dart';
import 'package:shop_app/screens/home/states.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = HomeController.get(
            context); // get object from cubit
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: State is! GetFavoritesLoadingModelData ? ListView.builder(
                itemCount: controller.getFavoritesModel?.data!.data!.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              controller.getFavoritesModel?.data!.data![index].product?.image != null?
                              CachedNetworkImage(
                                imageUrl: "${controller.getFavoritesModel?.data!.data![index].product?.image}",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.error,size: 50),
                              ):Container(),
                              controller.getFavoritesModel?.data!.data![index].product?.discount != 0? Container(
                                color: Colors.red,
                                child: const Text("DISCOUNT",style: TextStyle(color: Colors.white)),
                              ):Container(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 220,child: Text("${controller.getFavoritesModel?.data!.data![index].product?.name}",overflow: TextOverflow.ellipsis,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.bold),)),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${controller.getFavoritesModel?.data!.data![index].product?.price}",overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(color: Colors.deepOrange),),
                                const SizedBox(width: 5,),
                                Text("${controller.getFavoritesModel?.data!.data![index].product?.oldPrice}",overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(color: Colors.grey),),
                                //const Spacer(),
                                const SizedBox(width: 80,),
                                IconButton(onPressed: (){
                                  controller.addFavoritesProducts(controller.getFavoritesModel?.data!.data![index].product?.id as int);
                                }, color: controller.favorites[controller.getFavoritesModel?.data!.data![index].product?.id] as bool ? Colors.deepOrange : Colors.grey,
                                    icon: const Icon(
                                      Icons.favorite,size: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              },): const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
}
