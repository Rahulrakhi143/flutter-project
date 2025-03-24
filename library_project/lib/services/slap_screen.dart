import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';
import 'package:library_project/Special%20files/my_app_color.dart';
import 'package:library_project/services/slap_services.dart';

class MySlapScreen extends StatefulWidget {
  const MySlapScreen({super.key});

  @override
  State<MySlapScreen> createState() => _MySlapScreenState();
}

class _MySlapScreenState extends State<MySlapScreen> {
  SlapServicer slapServicer = new SlapServicer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slapServicer.isLogin(context);
    // Timer(const Duration(seconds: 3), (){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return const //MyLogin();
    //     MyHomePage();
    //   }));
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor().AppBackGround,
      body:  Center(
        child: Text('Welcome',style: MyAppTextStyle().lowerText2),
      ),
    );
  }
}
