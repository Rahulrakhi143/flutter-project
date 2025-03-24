import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Screen/HomeScreen.dart';
import 'package:my_project/Screen/auth/LoginScreen.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/Error%20correction/flutter%20toast.dart';
import 'package:my_project/Specific/MyfontStyle.dart';
import 'package:my_project/Specific/TextField/MyTextFeild.dart';
import 'package:my_project/Specific/TextField/MyTextFeildPassword.dart';
import 'package:my_project/Specific/buttons/Elevated%20Button.dart';


class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  Utils utils = Utils();
  final TextEditingController Phone = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final TextEditingController Re_Password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool Loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(
          vertical:  56,
        horizontal: 12
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/SignUp.png"),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height*0.25,
                  child: Text("Create Account",style:MyAppTextStyle().LoginAccount)
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height*0.6,
                child: Form(
                  key: _form,

                  child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      MyTextField(Hint: "Phone Number", Controller: Phone,Icon: Icons.phone,),

                      MyTextFieldPassword(Hint: "Password", Controller: Password),

                      MyTextFieldPassword(Hint: "Re Enter Password", Controller: Re_Password),
                      MyElevetedButton(
                        Loading: Loading,
                        onPressed: (){
                          //TODO implement
                          setState(() {
                            Loading = true;
                          });
                          AddFireBase();
                        },
                        Label: "Create Account",
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You already have an account",style: TextStyle(color: MyAppColor().TextColor,fontSize: MediaQuery.of(context).size.height*0.0175),),
                            TextButton(onPressed: (){//TODO implement it
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyLoginPage()));
                            }, child: Text("Login",style: TextStyle(color: MyAppColor().TextColor,fontSize:MediaQuery.of(context).size.height*0.0175 ,fontWeight:FontWeight.bold),))
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

  Future<void> CreateUserData() async {
   final  DatabaseReference Ref = FirebaseDatabase.instance.ref(Phone.text);
   await Ref.child("User Data").set({
     "id": "User",
     "Phone Number": Phone.text.toString(),
     "Password":Password.text.toString(),
   }).then((value){
     utils.ShowError("Data Added");
   }).onError((e,StackTrace){
     utils.ShowError(e.toString());
   });

  }

  Future<void> AddFireBase() async{
try {
  if (_form.currentState!.validate()) {
    final String Cuser = "${Phone.text}"+"@gmail.com";
    if(Password.text==Re_Password.text) {
    await _auth.createUserWithEmailAndPassword(
          email: Cuser, password: Password.text).then((value) {
        setState(() {
          Loading = false;
        });
        utils.ShowError("Account Create");
        CreateUserData();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyScreen()));
        Password.text = "";
        Re_Password.text = "";
        Phone.text = "";
      }).onError((e, StackTrace) {
        setState(() {
          Loading = false;
        });
        Password.text = "";
        Re_Password.text = "";
        Phone.text = "";
        utils.ShowError(e.toString());
      });
    }else{
      setState(() {
        Loading = false;
      });
      utils.ShowError("Enter Same Password");
    }
  }else{
    setState(() {
      Loading = false;
    });

  }
}catch(e)
    {
      setState(() {
        Loading = false;
      });
      Password.text = "";
      Re_Password.text = "";
      Phone.text = "";
    }
      }
}
