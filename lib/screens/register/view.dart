import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/defaultTextFormField.dart';
import 'package:shop_app/component/showMotionToast.dart';
import 'package:shop_app/helper/inputValidator.dart';
import 'package:shop_app/screens/register/controller.dart';
import 'package:shop_app/screens/register/states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterController(),
      child: BlocConsumer<RegisterController, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState ){

            showSuccessToast(context ,tilte: "Success" , description: "You are Register in successfully");

          } else if(state is RegisterFailState){

            showErrorToast(context, tilte: "Error", description: "Please enter the correct data ");

          }
        },
        builder: (context, state) {
          final controller = RegisterController.get(
              context); // get object from cubit
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text("Register",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Register now to get hot offers",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                          text: "Name",
                          controllerText:
                          controller.registerNameController,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextFormField(
                          text: "Email",
                          controllerText:
                          controller.registerEmailController,
                          icon: Icon(Icons.email),
                          validatorType: InputValidator.isEmailValid,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextFormField(
                            text: "Password",
                            controllerText:
                            controller.registerPassController,
                            icon: Icon(Icons.lock),
                            validatorType:
                            InputValidator.isPasswordValid),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                            text: "Phone",
                            controllerText:
                            controller.registerPhoneController,
                            icon: Icon(Icons.phone),
                            validatorType:
                            InputValidator.isPhoneValid),
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
                                  controller.register(context);
                                }
                              },
                              child: state is RegisterLoadingState
                                  ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                                  : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("  Register  ",style: TextStyle(fontSize: 26),),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("have an account?"),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign In",
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
