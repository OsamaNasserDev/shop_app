import 'package:flutter/material.dart';


class defaultTextFormField extends StatelessWidget {
  var ChangeSufixIcon;



  defaultTextFormField(
      {required this.text,
      this.icon,
      required this.controllerText,
      this.suffixIcon = false,
      this.validatorType,
      this.isPass = false,
      this.showPass = true ,
        this.ChangeSufixIcon ,
      }); //this.refresh
  var showPass;
  bool isPass;
  TextEditingController controllerText;
  String text;
  var icon;
  bool suffixIcon;
  var validatorType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,),
      child: TextFormField(

        validator: validatorType,
        obscureText: isPass ? showPass : isPass,
        controller: controllerText,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white12,
          suffixIcon: suffixIcon
              ? IconButton(
                  onPressed: () => ChangeSufixIcon(),
                  icon: showPass
                      ? Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.deepOrange,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.deepOrange,
                        ))
              : null,
          prefixIcon: icon,
          labelText: "${text}",
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
