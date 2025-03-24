
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeild.dart';
import 'package:library_project/Special%20files/Padding/paddings.dart';
import 'package:library_project/Special%20files/Values/MyAppValue.dart';
import 'package:library_project/Special%20files/button/Mybutton.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';

import '../Special files/my_app_color.dart';

class MyPostAdd extends StatefulWidget {
  final DatabaseShow;
  const MyPostAdd({super.key,required this.DatabaseShow});

  @override
  State<MyPostAdd> createState() => _MyPostAddState();
}

class _MyPostAddState extends State<MyPostAdd> {
  bool Loading= false;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var DatabaseRef;
 final TextEditingController Student_name_Controller = TextEditingController();
  final TextEditingController Student_Books_Controller = TextEditingController();
  final TextEditingController Student_Fathername_Controller = TextEditingController();
  final TextEditingController Student_Phone_Controller = TextEditingController();

 Future<void> AddStudentDetail() async {
   setState(() {
     DatabaseRef = widget.DatabaseShow;
   });
   try {
     final id = DateTime
         .now()
         .microsecondsSinceEpoch
         .toString();
     // DatabaseRef.child(id).child("Book").set({
     //   "id":1
     // });

     await DatabaseRef.child(id).set({
       'Name': Student_name_Controller.text.toString(),
       "Father's Name": Student_Fathername_Controller.text.toString(),
       'Phone': Student_Phone_Controller.text.toString(),
       'id': id,
     });
     DatabaseRef.child(id).child("Book").set({
       "id": 0
     }).then((value){
       Fluttertoast.showToast(msg: "Data is Added");
     });
   }catch(e){
     setState(() {
       Loading  = false;
     });
     Fluttertoast.showToast(msg: e.toString());
   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor().AppBackGround,
      appBar: AppBar(title: Text("Add Data",style: MyAppTextStyle().AppBarTextStyle,),backgroundColor: MyAppColor().AppBarBackGroundColor,),
      body:Padding(
        padding: MyPadding().HomePage,
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextField(Hint: "Enter Name", textLabel: "Name", Controller: Student_name_Controller),
                SizedBox(height: MyValue().SizedBox_height,),
                MyTextField(Hint: "Enter FatherName", textLabel: "FatherName", Controller: Student_Fathername_Controller),
                SizedBox(height: MyValue().SizedBox_height,),
                MyTextField(Hint: "Enter Phone Number", textLabel: "Phone Number", Controller: Student_Phone_Controller),
                SizedBox(height: MyValue().SizedBox_height,),
                // ListView.builder(itemBuilder: (context,index){
                //   return SizedBox(
                //     height: 10,
                //     width: 10,
                //     child: Column(
                //       children: [
                //       Text("Book$index", style: MyAppTextStyle().UperText1,),
                //                     TextFormField(
                //     keyboardType: TextInputType.numberWithOptions(),
                //     validator: (value){
                //       if(value!.isEmpty) {
                //         return "Enter Value";
                //       }
                //       return null;
                //     },
                //     controller: Student_Books_Controller,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       hintText: "Enter Book Name",
                //       hintStyle: MyAppTextStyle().TextFeild_HintStyle,
                //     ),
                //                     ),
                //                     ]
                //     ),
                //   );
                //       },itemCount: 1,
                // ),
                MyRoundedButton(label: "Add", onTap: (){
                  setState(() {
                    Loading = true;
                  });
                  if(_form.currentState!.validate())
                    {
                      setState(() {
                        AddStudentDetail();
                        Student_name_Controller.text="";
                        Student_Phone_Controller.text="";
                        Student_Fathername_Controller.text="";
                      });
                    }else
                      {
                        setState(() {
                          Loading = false;
                        });
                      }
            
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
