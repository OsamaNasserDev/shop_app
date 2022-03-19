import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/search/controller.dart';
import 'package:shop_app/screens/home/search/model.dart';
import 'package:shop_app/screens/home/search/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchController(),
      child: BlocConsumer<SearchController, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller =
              SearchController.get(context); // get object from cubit
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
              ),
              title: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  suffixIcon:const Icon(
                    Icons.search,
                    color: Colors.deepOrange,
                  ),

                  labelText: "search",
                  focusColor: Colors.white,

                ),
                controller: controller.searchTextController,
                onChanged: (value) {
                  controller.searchTextController.text = value;
                  controller.search(context);
                },
              ),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: State is! SearchLoadingState
                  ? ListView.builder(
                      itemCount:
                          controller.searchModel?.dataModel?.data?.length,
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
                                      controller.searchModel?.dataModel
                                                  ?.data?[index].image !=
                                              null
                                          ? Image.network(
                                              "${controller.searchModel?.dataModel?.data?[index].image}",
                                              fit: BoxFit.contain,
                                              width: 120,
                                              height: 120,
                                            )
                                          : Container(),
                                      // controller.getFavoritesModel?.data!.data![index].product?.discount != 0? Container(
                                      //   color: Colors.red,
                                      //   child: const Text("DISCOUNT",style: TextStyle(color: Colors.white)),
                                      // ):Container(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (controller.searchModel?.dataModel
                                            ?.data?[index].name !=
                                        null)
                                      SizedBox(
                                          width: 220,
                                          child: Text(
                                            "${controller.searchModel?.dataModel?.data?[index].name}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (controller.searchModel?.dataModel
                                                ?.data?[index].price !=
                                            null)
                                          Text(
                                            "${controller.searchModel?.dataModel?.data?[index].price}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.deepOrange),
                                          ),
                                        // const SizedBox(width: 5,),
                                        // Text("${ controller.searchModel?.dataModel?.data?[index]}",overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(color: Colors.grey),),
                                        //const Spacer(),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        // IconButton(onPressed: (){
                                        //   controller.addFavoritesProducts(controller.getFavoritesModel?.data!.data![index].product?.id as int);
                                        // }, color: controller.favorites[controller.getFavoritesModel?.data!.data![index].product?.id] as bool ? Colors.deepOrange : Colors.grey,
                                        //     icon: const Icon(
                                        //       Icons.favorite,size: 20,
                                        //     ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    )),
            ),
          );
        },
      ),
    );
  }
}
