import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Screen/HomeScreen.dart';
import 'package:my_project/Screen/auth/LoginScreen.dart';


class MySlapService{

  void Screen(BuildContext context){
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User = _auth.currentUser;

    if(User !=null && User.email !=null)
      {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>MyScreen()
            ),
          );
        });
      }
    else{
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>// MyPostAdd(CurrentUser: "manisha")//temp
            MyLoginPage()// main
          ),
        );
      });
    }
  }
}