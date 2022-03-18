import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/defaultTextFormField.dart';
import 'package:shop_app/component/defultButton.dart';
import 'package:shop_app/component/methods.dart';
import 'package:shop_app/component/showMotionToast.dart';
import 'package:shop_app/helper/inputValidator.dart';
import 'package:shop_app/screens/register/view.dart';
import 'package:shop_app/screens/sign_in/controller.dart';
import 'package:shop_app/screens/sign_in/states.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignInController(),
        child: BlocConsumer<SignInController, SignInStates>(
            listener: (context, state) {
              if(state is LoginSuccessState ){

                showSuccessToast(context ,tilte: "Success" , description: "You are logged in successfully");

              } else if(state is LoginFailState){

                showErrorToast(context, tilte: "Error", description: "Please enter the correct email and password");

              }
            },
            builder: (context, state) {
              final controller =
                  SignInController.get(context); // get object from cubit
              return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: BlocConsumer<SignInController, SignInStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final controller = SignInController.get(context);
                        return Form(
                          key: controller.formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Login",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("login now to get hot offers",
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                defaultTextFormField(
                                  text: "Email",
                                  controllerText:
                                      controller.signInEmailController,
                                  icon: Icon(Icons.email),
                                  validatorType: InputValidator.isEmailValid,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultTextFormField(
                                    text: "Password",
                                    controllerText:
                                        controller.signInPassController,
                                    icon: Icon(Icons.lock),
                                    validatorType:
                                        InputValidator.isPasswordValid),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  //height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.login(context);
                                        }
                                      },
                                      child: state is LoginLoadingState
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("  login  ",style: TextStyle(fontSize: 26),),
                                          )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have an account?"),
                                    TextButton(
                                      onPressed: () {
                                        navigateToAndR(context, RegisterScreen());
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              );
            }));
  }
}
