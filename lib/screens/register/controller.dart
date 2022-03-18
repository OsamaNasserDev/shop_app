import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/methods.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/screens/home/view.dart';
import 'package:shop_app/screens/register/states.dart';
import 'package:shop_app/screens/sign_in/model.dart';
import 'package:shop_app/screens/sign_in/view.dart';


class RegisterController extends Cubit<RegisterStates> {
  RegisterController() : super(RegisterInitialState());

  static RegisterController get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerPhoneController = TextEditingController();

  register(context) {
    print("Register Loading  State");
    emit(RegisterLoadingState());
    DioHelper.postData(endPoint: "register",data: {
      "name": registerNameController.text.toString().trim(),
      "email": registerEmailController.text.toString().trim(),
      "password":registerPassController.text.toString().trim(),
      "phone":registerPhoneController.text.toString().trim(),
    } ).then((value)  {
      print("register value is ${value.data}");
      var loginModel = LoginModel.fromJson(value.data);
      if(loginModel.status ){
        navigateToAndR(context, SignInScreen());
        print("Register Success State");
        emit(RegisterSuccessState());
      }

    }).catchError((error){
      emit(RegisterFailState());
      print('error is ${error.toString()}');});
  }
}
