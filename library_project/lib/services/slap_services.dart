import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_project/Screens/home.dart';
import 'package:library_project/auth/login.dart';

class SlapServicer {
  void isLogin(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null && user.email != null) {
      String cUser = user.email!;
      cUser = cUser.substring(0, cUser.indexOf('@')).toLowerCase();
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>// MyPostAdd(CurrentUser: "manisha")//temp
                 MyHomePage(CUser: cUser), // main
          ),
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyLogin(),
          ),
        );
      });
    }
  }
}
