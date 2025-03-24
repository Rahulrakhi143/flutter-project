
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Screen/auth/LoginScreen.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/Error%20correction/flutter%20toast.dart';
import 'package:my_project/Specific/MyfontStyle.dart';
import 'package:my_project/Specific/firebase%20database/fetchdata.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  Utils utils = Utils();
  String? Phone;
  String? Password;
  Future<void> getData() async{
    // final Cuser = setCurrentCostumer();
     Map<dynamic,dynamic> map = await GetCurrentUserDataMap();
     final data= map["User Data"];
        setState(() {
          Password = data["Password"];
          Phone = data["Phone Number"];
        }
        );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/SignUp.png"),fit: BoxFit.cover),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: MyAppColor().AppBarBackColor,
          title: MyAppTextStyle().MyTextB(context, "Profile"),

        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 56,
            right: 12,
            left: 12
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(
                children: [
                  MyAppTextStyle().MyTextB(context,"Phone Number:"),
                  SizedBox(width: 20,),
                  MyAppTextStyle().MyText(context, Phone ?? "Loading.."),
                ],
              ),
              Row(
                children: [
                  MyAppTextStyle().MyTextB(context,"Password: "),
                  SizedBox(
                    width: 20,
                  ),
                  MyAppTextStyle().MyText(context, Password ??"Loading"),
                ],
              ),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyLoginPage()));
              }, child: MyAppTextStyle().MyText(context, "LogOut"))
            ],
          ),
        ),
      ),
    );
  }
}
