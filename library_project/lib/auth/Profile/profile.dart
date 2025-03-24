import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/Fluttertoast/Utils.dart';
import 'package:library_project/Special%20files/Stream%20Showdata/showMydilogueBox.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';
import 'package:library_project/Special%20files/my_app_color.dart';
import 'package:library_project/auth/login.dart';

class MyProfile extends StatefulWidget {
  final Map? map;

  const MyProfile({super.key, this.map});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Utils utils = Utils();
  final _auth = FirebaseAuth.instance;
  DilogBox dilogBox = DilogBox();
  String CUSER = "User Data";
  late Map? userMap;

  @override
  void initState() {
    super.initState();
    userMap = widget.map;
    if(userMap!.isEmpty)
      {
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyLogin()));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor().AppBackGround,
      appBar: AppBar(
        title: Text("My Profile", style: MyAppTextStyle().AppBarTextStyle),
        backgroundColor: MyAppColor().AppBarBackGroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Wrapping ListView in Expanded to give it bounded height
          Container(
            height: MediaQuery.of(context).size.height*3/4,
            child: ListView(
              children: [
                if (userMap != null && userMap?[CUSER] != null)
                  Column(
                    children: [
                      dilogBox.MyList(
                       subTitle : userMap?[CUSER]["Institute Name"]??"Unknown" ,
                        title:"Institute",// Provide a default value
                      ),
                      dilogBox.MyList(
                        title: "Name",
                        subTitle: userMap?[CUSER]['Name']??"Unknown"
                      ),
                      dilogBox.MyList(
                        title:"Email Address",
                      subTitle: userMap?[CUSER]["Email"]??"Unknown"
                      ),
                      dilogBox.MyList(
                        title: "Password",
                        subTitle: userMap?[CUSER]["Password"]??"Unknown"
                      )
                    ],
                  )
                // Check if the map and key ex
                else
                  Center(
                    child: Text(
                      'User information not available',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),

          // Logout button
          TextButton(
            onPressed: () {
              try {
                _auth.signOut().then((value) {
                  utils.Massage("Sign Out");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                  );
                }).onError((error, stackTrace) {
                  utils.Massage(error.toString());
                });
              } catch (e) {
                utils.Massage(e.toString());
              }
            },
            child: Text("Log out", style: MyAppTextStyle().LogOutText),
          ),
        ],
      ),
    );
  }
}
