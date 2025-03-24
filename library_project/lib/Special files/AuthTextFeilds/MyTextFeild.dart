import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';


class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.Hint, required this.textLabel, required this.Controller});
  final String textLabel;
  final String Hint;
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.textLabel, style: MyAppTextStyle().LableTextStyle,),
        ),
        TextFormField(
          maxLength: widget.textLabel.contains("Phone Number") ? 10: 70,
          keyboardType: widget.textLabel.contains("Phone Number") ? TextInputType.numberWithOptions() : TextInputType.text,
          validator: (value){
            if(value!.isEmpty){
              return widget.textLabel.contains("User Name") || widget.textLabel.contains("Name") || widget.textLabel.contains("FatherName") || widget.textLabel.contains("Phone Number") ? "Enter UserName" : "Enter Email";
            }else if((!value.contains("@gmail.com") && !(widget.textLabel.contains("User Name") || widget.textLabel.contains("Name") || widget.textLabel.contains("FatherName") || widget.textLabel.contains("Phone Number")))){
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
              child: Text(widget.textLabel.contains("Email") ? "@gmail.com" : "", style: MyAppTextStyle().TextFeild_HintStyle,),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: widget.Hint,
            hintStyle: MyAppTextStyle().TextFeild_HintStyle,
          ),
        ),
      ],
    );
  }
}