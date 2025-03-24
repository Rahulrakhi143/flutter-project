import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';


class MyTextFieldPassword extends StatefulWidget {
   MyTextFieldPassword({super.key,ObscureText,required this.textLabel,this.Controller,this.Hint});
   bool ObscureText = true;
   final String textLabel;
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.textLabel,style: MyAppTextStyle().LableTextStyle,),
        ),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: IconButton(onPressed:(){
                setState(() {
                  widget.ObscureText = !widget.ObscureText;
                });
              }, icon: Icon(widget.ObscureText ? Icons.security : Icons.remove_red_eye_outlined)),
              hintStyle: MyAppTextStyle().TextFeild_HintStyle,
              hintText: widget.Hint,
            ),
          obscureText: widget.ObscureText,
        ),
      ],
    );
  }
}
