import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/categories/view.dart';
import 'package:shop_app/screens/home/favorites/get_fav_data_model.dart';
import 'package:shop_app/screens/home/favorites/model.dart';
import 'package:shop_app/screens/home/favorites/view.dart';
import 'package:shop_app/screens/home/categories/model.dart';
import 'package:shop_app/screens/home/products/model.dart';
import 'package:shop_app/screens/home/products/view.dart';
import 'package:shop_app/screens/home/settings/view.dart';
import 'package:shop_app/screens/home/states.dart';
import 'package:shop_app/screens/sign_in/model.dart';


class HomeController extends Cubit<HomeStates> {
  HomeController() : super(HomeInitialState());

  static HomeController get(context) => BlocProvider.of(context);

  TextEditingController profileNameController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController profilePhoneController = TextEditingController();

  // changeProfileText(){
  //   getProfileData?.data.name != null ? profileNameController.text = getProfileData?.data.name as String : null ;
  //   getProfileData?.data.email != null ? profileEmailController.text = getProfileData?.data.email as String : null ;
  //   getProfileData?.data.phone != null ? profilePhoneController.text = getProfileData?.data.phone as String : null ;
  //   emit(changeProfileTextState());
  // }

  int currentBottomIndex = 0;

  List currentPage = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  ChangeBottomNavBarIndex(index) {
    currentBottomIndex = index;
     if(currentBottomIndex == 2 && categoriesModel == null){
       getCategoriesData();
     }

    emit(ChangeBottomNavBarIndexState());
  }



  // favorites
  Map<int? ,bool?> favorites = {};

  // get home data
  HomeModel? homeModel ;
  getHomeData(){
    emit(HomeLoadingModelData());
    DioHelper.getData(endPoint: 'home',token: CacheHelper.readToken()).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel?.status);
      // print(homeModel?.data!.banners![0].image);

      homeModel?.data!.products?.forEach((element) {
        favorites.addAll({
          element.id : element.inFavorites ,
        });
      });
      print(favorites.toString());
      emit(HomeSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(HomeFailModelData());
    });

  }

  // get categories data
  CategoriesModel? categoriesModel ;
  getCategoriesData(){
    emit(CategoriesLoadingModelData());
    DioHelper.getData(endPoint: 'categories',token: CacheHelper.readToken()).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print('categories');
      // print(categoriesModel?.status);
      // print(categoriesModel?.categoriesData!.currentPage);
      emit(CategoriesSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(CategoriesFailModelData());
    });
  }



  // Add Favorites Model
  AddFavoritesModel? addFavoritesModel ;
  addFavoritesProducts(int productId){
    if(favorites[productId] == true){
      favorites[productId] = false ;
      emit(FavoritesLoadingModelData());
    }else if(favorites[productId] == false){
      favorites[productId] = true ;
      emit(FavoritesLoadingModelData());
    }

    DioHelper.postData(
        endPoint: 'favorites',
        token: CacheHelper.readToken(),
        data: {
      'product_id' : productId ,
    }).then((value) {
      addFavoritesModel = AddFavoritesModel.fromJson(value.data);
      print('favorites');
      print(addFavoritesModel?.status);

      // handle
      if(addFavoritesModel?.status == false){
        if(favorites[productId] == true){
          favorites[productId] = false ;
          emit(FavoritesLoadingModelData());
        }else if(favorites[productId] == false){
          favorites[productId] = true ;
          emit(FavoritesLoadingModelData());
        }
      }else{
        getFavoritesData();
      }
      // print(addFavoritesModel?.message);
      emit(FavoritesSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      // handle
      if(favorites[productId] == true){
        favorites[productId] = false ;
        emit(FavoritesLoadingModelData());
      }else if(favorites[productId] == false){
        favorites[productId] = true ;
        emit(FavoritesLoadingModelData());
      }

      emit(FavoritesFailModelData());
    });
  }


  // get fav data
  GetFavoritesDataModel? getFavoritesModel ;
  getFavoritesData(){
    emit(GetFavoritesLoadingModelData());
    DioHelper.getData(endPoint: 'favorites', lang: 'en',token: CacheHelper.readToken()).then((value) {
      getFavoritesModel = GetFavoritesDataModel.fromJson(value.data);
      print(getFavoritesModel?.status);
      print(getFavoritesModel?.data!.data?.length);
      print("image url is  >>            ");
      print(getFavoritesModel?.data!.data?[1].product?.image);
      //print(favorites.toString());
      emit(GetFavoritesSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(GetFavoritesFailModelData());
    });

  }


  // get profile data
  LoginModel? getProfileData ;
  getProfileDataModel(){
    emit(GetProfileLoadingModelData());
    DioHelper.getData(endPoint: 'profile', lang: 'en',token: CacheHelper.readToken()).then((value) {
      getProfileData = LoginModel.fromJson(value.data);
      print("profile data");
      print(getProfileData?.status);
      print(getProfileData?.data.name);
      emit(GetProfileSuccessModelData());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(GetProfileFailModelData());
    }
    );

  }

  // update
  updateUserData(context) {
    emit(UpdateLoadingState());
    DioHelper.putData(token: CacheHelper.readToken(),endPoint: "update-profile",data: {
      "name": profileNameController.text.toString().trim(),
      "phone":profilePhoneController.text.toString().trim(),
      "email":profileEmailController.text.toString().trim(),
    } ).then((value)  {
      print("update value is ${value.data}");
      var loginModel = LoginModel.fromJson(value.data);
      if( loginModel.status  ){
        getProfileDataModel();
        emit(UpdateSuccessState());
      }

    }).catchError((error){
      emit(UpdateFailState());
      print('error is ${error.toString()}');});
  }



  var formKey = GlobalKey<FormState>(); // profile

}
