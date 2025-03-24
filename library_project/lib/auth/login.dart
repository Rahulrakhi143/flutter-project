import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_project/Screens/home.dart';
import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeild.dart';
import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeildPassword.dart';
import 'package:library_project/Special%20files/Padding/paddings.dart';
import 'package:library_project/Special%20files/Values/MyAppValue.dart';
import 'package:library_project/Special%20files/button/Mybutton.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';
import 'package:library_project/Special%20files/my_app_color.dart';
import 'package:library_project/auth/Sign%20in%20page/Sign_in_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}
class _MyLoginState extends State<MyLogin> {
  var opacity = true;
  var Loading  = false;
  TextEditingController PasswordController =  TextEditingController();
  TextEditingController EmailController = TextEditingController();
  GlobalKey<FormState> _form = new GlobalKey<FormState>();
  String User = "";
  final _auth = FirebaseAuth.instance;

  Future<void> Login()async{
    try{
      await _auth.signInWithEmailAndPassword(email: EmailController.text.toString(), password: PasswordController.text.toString()).then((value){
        setState(() {
          Loading=false;
          User = EmailController.text;
          User = User.substring(0,User.indexOf('@')).toLowerCase();
          EmailController.text="";
          PasswordController.text="";
        });
        Fluttertoast.showToast(msg: "Login Successfull");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(CUser: User,)));
      }).onError((error,stackTrace){
        Fluttertoast.showToast(msg: error.toString());
        setState(() {
          Loading = false;
        });
      });
    }catch(e){
      setState(() {
        Loading = false;
      });
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  // Future<void> CheckLogin() async {
  //   if (EmailController.text != "" && PasswordController.text != "") {
  //     try {
  //       String uri = "http://10.0.2.2/crud/check_login.php";
  //       var result = await http.post(Uri.parse(uri), body: {
  //         "email": EmailController.text,
  //         "password": PasswordController.text
  //       });
  //       var response = jsonDecode(result.body);
  //       if (response["success"] == "true") {
  //         Fluttertoast.showToast(msg: "Record inserted");
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => const MyHomePage()));
  //       }
  //       else {
  //         Fluttertoast.showToast(msg: "Failed to insert");
  //       }
  //     } catch (e) {
  //       Fluttertoast.showToast(msg: e.toString());
  //     }
  //   } else {
  //     Fluttertoast.showToast(msg: "Password Not Mached");
  //   }
  // }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyAppColor().AppBackGround,
        appBar: AppBar(
          title: Text("Login Page", style: MyAppTextStyle().AppBarTextStyle,),
          backgroundColor: MyAppColor().AppBarBackGroundColor,
        ),
        body: Form(
          key: _form,
          child: Padding(
            padding: MyPadding().AuthPadding,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login", style: MyAppTextStyle().TextHeading,),
                    MyTextField(Hint: "Enter Email",
                      textLabel: "Email",
                      Controller: EmailController,
                    ),
                     SizedBox(height: MyValue().SizedBox_height),
                    MyTextFieldPassword(textLabel: "Password",
                        Controller: PasswordController,
                        ObscureText: true,
                        Hint: "Enter Password"),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text(
                          "forget Password",
                          style: MyAppTextStyle().TextButtonStyle,))
                      ],
                    ),
                     SizedBox(height:MyValue().SizedBox_height),
                    MyRoundedButton(
                        label: "Login", Loading: Loading, onTap: () {
                      setState(() {
                        Loading = true;
                      });
                      if (_form.currentState!.validate()) {
                        setState(() {
                          // CheckLogin();
                          Login();
                        });
                      }else{
                        setState(() {
                          Loading = false;
                        });
                      }
                    }),
                    SizedBox(height: MyValue().SizedBox_height),
                    MyRoundedButton(label: "Create new Account", onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => const MySigninUser()));
                    }),
                    SizedBox(height:MyValue().SizedBox_height ),
                    Text("OR", style: MyAppTextStyle().lowerText2,),
                    MyRoundedButton(label: "Login with Google", onTap: () {})
                  ],
                ),
              ),
            ),
          ),
        ),

      );
    }
  }