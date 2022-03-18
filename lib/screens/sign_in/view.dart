import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/defaultTextFormField.dart';
import 'package:shop_app/helper/inputValidator.dart';
import 'package:shop_app/screens/sign_in/controller.dart';
import 'package:shop_app/screens/sign_in/states.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: BlocConsumer<SignInController,SignInStates>(
            listener: (context, state) {},
              builder: (context,state) {
                final controller =SignInController.get(context);
                return  Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400)),
                        SizedBox(height: 5,),
                        Text("login now to get hot offers",style: TextStyle(fontSize: 20,)),

                        SizedBox(height: 30,),
                        defaultTextFormField(text: "Email", controllerText: controller.signInEmailController , icon: Icon(Icons.email),validatorType: InputValidator.isEmailValid,),
                        SizedBox(height: 10,),
                        defaultTextFormField(text: "Password", controllerText: controller.signInPassController,icon: Icon(Icons.lock),validatorType: InputValidator.isPasswordValid),
                        SizedBox(height: 10,),
                        Center(
                          child: ElevatedButton(onPressed: (){
                            if(controller.formKey.currentState!.validate()){
                              controller.login(context);
                            }

                          }, child: state is LoginLoadingState ? CircularProgressIndicator(color: Colors.white,):Text("  login  ")),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
