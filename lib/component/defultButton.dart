import 'package:flutter/material.dart';

class defultButton extends StatelessWidget {
  String text;

  double fontSize;
  double bourderRadius;
  Color primary ;
  Color onPrimary ;
  Color textColor ;
  Function onPressed ;

   defultButton({required this.text,required this.fontSize,this.bourderRadius = 24 ,this.primary = Colors.white ,this.onPrimary = Colors.grey,this.textColor =Colors.black87, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primary,
        onPrimary: onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(bourderRadius)),
        fixedSize: const Size.fromHeight(50),
      ),
      onPressed: () =>  onPressed(),
      child:
          Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic
            ),
          ),



    );
  }
}
