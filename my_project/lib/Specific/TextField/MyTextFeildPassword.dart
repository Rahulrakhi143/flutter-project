import 'package:flutter/material.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/MyfontStyle.dart';

class MyTextFieldPassword extends StatefulWidget {
   MyTextFieldPassword({super.key,ObscureText,this.Controller,this.Hint});
   bool ObscureText = true;
   final TextEditingController? Controller;
   final String? Hint;
  @override
  State<MyTextFieldPassword> createState() => _MyTextFieldPasswordState();
}

class _MyTextFieldPasswordState extends State<MyTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: (value){
            if(value!.isEmpty)
              {
                return "Enter Password";
              }
            else if(value.length<=8){
              return "Enter Minimum 8 number";
            }
            return null;
          },
          controller: widget.Controller,
            decoration: InputDecoration(
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
              suffixIcon: IconButton(onPressed:(){
                setState(() {
                  widget.ObscureText = !widget.ObscureText;
                });
              }, icon: Icon(widget.ObscureText ? Icons.security : Icons.remove_red_eye_outlined)),
              hintStyle: MyAppTextStyle().TextFeild_HintStyle,
              prefixIcon: const Icon(Icons.lock_open_outlined),
              hintText: widget.Hint,
            ),
          obscureText: widget.ObscureText,
        ),
      ],
    );
  }
}
