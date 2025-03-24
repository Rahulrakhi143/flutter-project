//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeild.dart';
// import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeildPassword.dart';
// import 'package:library_project/Special%20files/Padding/paddings.dart';
// import 'package:library_project/Special%20files/Values/MyAppValue.dart';
// import 'package:library_project/Special%20files/button/Mybutton.dart';
// import 'package:library_project/Special%20files/my_app_Text_style.dart';
// import 'package:library_project/Special%20files/my_app_color.dart';
// import 'package:library_project/auth/login.dart';
//
// class MySigninUser extends StatefulWidget {
//   const MySigninUser({super.key});
//   @override
//   State<MySigninUser> createState() => _MySigninUserState();
// }
// class _MySigninUserState extends State<MySigninUser> {
//   String UserName="";
//   bool Loading = false;
//   List<String> role =["librarian","student"];
//   String roleValue = "student";
//   TextEditingController email = TextEditingController();
//   TextEditingController name =  TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController Re_Password =  TextEditingController();
//   TextEditingController InstituteName = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   Future<void> CreateDatabase(String Username)async{
//     final DatabaseReference databaseRef = FirebaseDatabase.instance.ref(Username);
//     final id =  DateTime.now().microsecondsSinceEpoch.toString();
//     await databaseRef.child("User Data").set({
//       'id':id,
//       'Name': name.text.toString(),
//       'Email':email.text.toString(),
//       'Password':password.text.toString(),
//       'Institute Name': InstituteName.text.toString(),
//       'role' : roleValue
//     }).then((value){
//       Fluttertoast.showToast(msg: "data Added");
//       databaseRef.child("student Data");
//       setState(() {
//         Loading = false;
//         Navigator.pop(context);
//       });
//     }).onError((error,stackTrace){
//       setState(() {
//         Loading = false;
//       });
//     });
//   }
//
//   // insert VY firebas
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     email.dispose();
//     password.dispose();
//     name.dispose();
//     Re_Password.dispose();
//     InstituteName.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       backgroundColor: MyAppColor().AppBackGround,
//       appBar: AppBar(
//         backgroundColor: MyAppColor().AppBarBackGroundColor,
//         title: Text("SignIn Page",style: MyAppTextStyle().AppBarTextStyle,),
//       ),
//       body:Padding(
//         padding: MyPadding().AuthPadding,
//         child: Form(
//           key: _formKey,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("SignIn Page",style: MyAppTextStyle().TextHeading,),
//                   MyTextField(Hint: "Enter User name", textLabel: "User Name", Controller: name),
//                   SizedBox(height: MyValue().SizedBox_height,),
//                   MyTextField(Hint: "Enter Institute Name", textLabel: "Institute Name", Controller: InstituteName),
//                   SizedBox(height: MyValue().SizedBox_height),
//                   MyTextField(Hint: "Enter Email", textLabel: "Email", Controller: email),
//                   SizedBox(height: MyValue().SizedBox_height),
//                   Column(children: [
//                   MyTextFieldPassword(textLabel: "Password",Hint: "Enter password",ObscureText: true,Controller: password,),
//                   SizedBox(height: MyValue().SizedBox_height),
//                   MyTextFieldPassword(textLabel: "Re-Enter Password",Hint: "Enter Password",ObscureText: true,Controller: Re_Password,),
//                                ]),
//                   SizedBox(height: MyValue().SizedBox_height),
//                   DropdownButtonFormField<String>(
//                     value: role,
//                     decoration: InputDecoration(
//                       labelText: 'Category',
//                       border: OutlineInputBorder(),
//                     ),
//                     items: roleValue.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       role = newValue!;
//                     },
//                   )
//                   const SizedBox(height: 20,),
//                   MyRoundedButton(label: "Submit", Loading:Loading,onTap: (){
//                     setState(() {
//                       Loading = true;
//                     });
//                     if(_formKey.currentState!.validate()){
//                       setState(() {
//                         SignIn();
//                       });
//                       }else{
//                       setState(() {
//                         Loading = false;
//                       });
//                     }
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void SignIn() async{
//     try {
//       _auth.createUserWithEmailAndPassword(
//           email: email.text.toString(),
//           password: password.text.toString())
//           .then((value) {
//         setState(() {
//           Loading = false;
//           UserName = email.text.toString();
//           UserName = UserName.substring(0,UserName.indexOf("@")).toLowerCase();
//           CreateDatabase(UserName);
//           name.text="";
//           email.text = "";
//           password.text = "";
//           Re_Password.text = "";
//           InstituteName.text = "";
//         });
//         Fluttertoast.showToast(msg: "Data Inserted ");
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => MyLogin()));
//
//       }).onError((error, stackTrace) {
//         setState(() {
//           Loading = false;
//         });
//         Fluttertoast.showToast(msg: error.toString());
//       });
//     }catch(e){
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
//
// // insert VY php
// // Future<void> inserrecord() async
// // {
// //   if(name.text!="" && email.text!="" && password.text!="" && Re_Password.text!="")
// //     {
// //       if(password.text.toString().contains(Re_Password.text.toString())) {
// //         try {
// //           String uri = "http://10.0.2.2/crud/insert_record.php";
// //           var result = await http.post(Uri.parse(uri), body: {
// //             "email": email.text,
// //             "name": name.text,
// //             "password": password.text
// //           });
// //           var response = jsonDecode(result.body);
// //           if (response["success"] == "true") {
// //             Fluttertoast.showToast(msg: "Record inserted");
// //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage()));
// //           }
// //           else {
// //             Fluttertoast.showToast(msg: "Failed to insert");
// //           }
// //         } catch (e) {
// //           Fluttertoast.showToast(msg: e.toString());
// //         }
// //       }else{
// //         Fluttertoast.showToast(msg: "Password Not Mached");
// //       }
// //     }else{
// //     Fluttertoast.showToast(msg: "Please Fill All this");
// //   }
// // }
// }