import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  void ShowError(String Label){
    Fluttertoast.showToast(msg: Label,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.TOP
    );
  }
}