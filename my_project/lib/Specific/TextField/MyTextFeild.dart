import 'package:flutter/material.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/MyfontStyle.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.Hint, required this.Controller,this.Icon});
  final String Hint;
  final Icon;
  final TextEditingController Controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        TextFormField(
          maxLength: widget.Hint.contains("Phone Number") ? 10: 70,
          keyboardType: widget.Hint.contains("Phone Number") ? const TextInputType.numberWithOptions() : TextInputType.text,
          validator: (value){
            if(value!.isEmpty){
              return widget.Hint.contains("User Name") || widget.Hint.contains("Name") || widget.Hint.contains("FatherName") || widget.Hint.contains("Phone Number") ? "Enter UserName" : "Enter Email";
            }else if((!value.contains("@gmail.com") && !(widget.Hint.contains("User Name") || widget.Hint.contains("Name") || widget.Hint.contains("FatherName") || widget.Hint.contains("Phone Number")))){
              return "Enter Valid Email";
            }
            return null;
          },
          controller: widget.Controller,
          decoration: InputDecoration(

            suffix: InkWell(
              onTap: () {
                setState(() {
                  if (!(widget.Controller.text.contains("@gmail.com"))) {
                    widget.Controller.text += "@gmail.com";
                  }
                });
              },
              child: Text(widget.Hint.contains("Email") ? "@gmail.com" : "", style: MyAppTextStyle().TextFeild_HintStyle,),
            ),
            fillColor: MyAppColor().TextFieldBackGround,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: const BorderSide(color: Colors.black)
            ),
            hintText: widget.Hint,
            prefixIcon: Icon(widget.Icon),
            hintStyle: MyAppTextStyle().TextFeild_HintStyle,
          ),
        ),
      ],
    );
  }
}