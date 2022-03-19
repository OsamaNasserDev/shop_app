import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/search/model.dart';
import 'package:shop_app/screens/home/search/states.dart';


class SearchController extends Cubit<SearchStates> {
  SearchController() : super(SearchInitialState());

  static SearchController get(context) => BlocProvider.of(context);

  var searchTextController = TextEditingController();


  SearchModel? searchModel ;
  search(context) {
    print("Search Loading  State");
    emit(SearchLoadingState());
    DioHelper.postData(token: CacheHelper.readToken(),endPoint: "products/search",data: {
      "text": searchTextController.text.toString().trim(),
    } ).then((value)  {
      print("Search value is ${value.data}");
      searchModel = SearchModel.fromJson(value.data);
      if(searchModel?.status != null &&  searchModel?.status == true ){
        print("Search Success State");
        emit(SearchSuccessState());

      }

    }).catchError((error){
      emit(SearchFailState());
      print('error is ${error.toString()}');});
  }
}
