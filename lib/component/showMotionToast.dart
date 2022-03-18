
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

showSuccessToast(context , { required String tilte , required String description}){
  MotionToast.success(
      title:   Text(tilte),
      position: MOTION_TOAST_POSITION.bottom,
      //layoutOrientation: ORIENTATION.rtl,
      description:   Text(description),
      width:  300
  ).show(context);
}

showErrorToast(context , { required String tilte , required String description}){
  MotionToast.error(
      title:  Text(tilte),
      position: MOTION_TOAST_POSITION.bottom,
      //layoutOrientation: ORIENTATION.rtl,
      description:  Text(description)
  ).show(context);
}