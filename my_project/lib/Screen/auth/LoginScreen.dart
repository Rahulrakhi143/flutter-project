import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Screen/HomeScreen.dart';
import 'package:my_project/Screen/auth/SignUpScreen.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/Error%20correction/flutter%20toast.dart';
import 'package:my_project/Specific/MyfontStyle.dart';
import 'package:my_project/Specific/TextField/MyTextFeild.dart';
import 'package:my_project/Specific/TextField/MyTextFeildPassword.dart';
import 'package:my_project/Specific/buttons/Elevated%20Button.dart';


class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool Loading = false;
  final TextEditingController Phone = TextEditingController();
  final TextEditingController Password = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Utils utils = Utils();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(
        vertical:  56,
            horizontal: 12
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/Login.png"),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: Text("Login Account",style: MyAppTextStyle().LoginAccount)),
             Container(
               alignment: Alignment.bottomCenter,
               height: MediaQuery.of(context).size.height*0.5,
               child: Form(
                 key: _form,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     MyTextField(Hint: "Phone Number", Controller: Phone,Icon: Icons.phone,),
                     MyTextFieldPassword(Hint: "Password", Controller: Password),
                     SizedBox(height: 5,),
                     Container(alignment: Alignment.centerRight, child: Text("forget password    ",style: TextStyle(color:MyAppColor().TextColor,fontSize:MediaQuery.of(context).size.height*0.0175 ,fontWeight:FontWeight.bold))),
                     SizedBox(height: 10,),
                     MyElevetedButton(
                       Loading: Loading,
                       onPressed: (){
                         //TODO implement
                         setState(() {
                           Loading = true;
                         });
                         if(_form.currentState!.validate())
                           {
                             Login();
                           }else{
                           setState(() {
                             Loading = false;
                           });
                         }

                       },
                       Label: "Login",
                     ),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Don't have an account",style: TextStyle(color: MyAppColor().TextColor,fontSize: MediaQuery.of(context).size.height*MyAppColor().text),),
                           TextButton(onPressed: (){//TODO implement it
                             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const MySignUpPage()));
                           }, child: Text("Create",style: TextStyle(color: MyAppColor().TextColor,fontSize:MediaQuery.of(context).size.height*MyAppColor().text ,fontWeight:FontWeight.bold),))
                         ]
                     )
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Login() async
  {
    String Cuser = Phone.text;
    Cuser = "$Cuser"+"@gmail.com";
    _auth.signInWithEmailAndPassword(email: Cuser, password: Password.text).then((value){
      setState(() {
        Loading = false;
      });
      utils.ShowError("Signed in");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return MyScreen();}));
      Phone.text = "";
      Password.text = "";
    }).onError((e,StackTrace){
      setState(() {
        Loading = false;
      });
      Phone.text = "";
      Password.text = "";
      utils.ShowError(e.toString());
    });
  }
}
