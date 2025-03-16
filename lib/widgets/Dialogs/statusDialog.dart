// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;


class SuccessDialog {
  static void show(BuildContext context, String message) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength: toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class Fluttertoast {
}

class ErrorDialog {
  static void show(BuildContext context, String message) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength: toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class InfoDialog {
  static void show(BuildContext context, String message) {
    
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength: toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
