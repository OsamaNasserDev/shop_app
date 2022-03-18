import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/defaultTextFormField.dart';
import 'package:shop_app/component/defultButton.dart';
import 'package:shop_app/component/methods.dart';
import 'package:shop_app/screens/home/controller.dart';
import 'package:shop_app/screens/home/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        final controller = HomeController.get(context); // get object from cubit
        controller.getProfileData?.data.name != null ? controller.profileNameController.text = controller.getProfileData?.data.name as String : null ;
        controller.getProfileData?.data.email != null ? controller.profileEmailController.text = controller.getProfileData?.data.email as String : null ;
        controller.getProfileData?.data.phone != null ? controller.profilePhoneController.text = controller.getProfileData?.data.phone as String : null ;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    defaultTextFormField(text:"Name",controllerText:controller.profileNameController  ,icon: Icon(Icons.person)),
                    defaultTextFormField(text:"Email",controllerText: controller.profileEmailController,icon: Icon(Icons.email)),
                    defaultTextFormField(text:"Phone",controllerText: controller.profilePhoneController,icon: Icon(Icons.phone)),
                    SizedBox(height: 18,),
                    defultButton(text: '   Logout   ', bourderRadius : 14,fontSize: 20, onPressed: ()=> signOut(context),textColor: Colors.white ,primary: Colors.deepOrange),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
