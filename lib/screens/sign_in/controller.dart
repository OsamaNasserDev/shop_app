import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/methods.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/view.dart';
import 'package:shop_app/screens/sign_in/model.dart';
import 'package:shop_app/screens/sign_in/states.dart';


class SignInController extends Cubit<SignInStates> {
  SignInController() : super(SignInInitialState());

  static SignInController get(context) => BlocProvider.of(context);
  final signInEmailController = TextEditingController();
  final signInPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // defaultTextFormField
  bool showPass = true;
  ChangeSufixIcon() {
    // print('try emit');
    showPass = !showPass ;
    emit(LoginChangeSufixIconState());
  }
  // @override
  // Future<void> close() {
  //   loginUserController.clear();
  //   loginPassController.clear();
  //   return super.close();
  // }

  // late LoginModel loginModel ;
  // Api
  login(context) {
    emit(LoginLoadingState());
    DioHelper.postData(endPoint: "login",data: {
      "email": signInEmailController.text.toString().trim(),
      "password":signInPassController.text.toString().trim(),
    } ).then((value)  {
       print("login value is ${value.data}");
      var loginModel = LoginModel.fromJson(value.data);
      CacheHelper.writeToken(value: loginModel.data.token).then((value) {
        print("value is ${value}");
         if(value && loginModel.data != null ){
           navigateToAndR(context, HomeScreen());
           emit(LoginSuccessState(loginModel));
         }
      });
      // print(loginModel.data.token);



    }).catchError((error){
      emit(LoginFailState());
      print('error is ${error.toString()}');});
  }
}
