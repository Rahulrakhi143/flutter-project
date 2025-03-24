import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Specific/MyfontStyle.dart';

class Myaccounttextfield extends StatefulWidget {
  final String Hint;
  final Controller;
  final onChanged;
  const Myaccounttextfield({super.key,this.Hint = "h",this.Controller,this.onChanged});

  @override
  State<Myaccounttextfield> createState() => _MyaccounttextfieldState();
}

class _MyaccounttextfieldState extends State<Myaccounttextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (widget.Hint.contains("0")|| widget.Hint.contains("0.0"))?MediaQuery.of(context).size.width*0.16 : MediaQuery.of(context).size.width*0.4,
      child:  TextFormField(
        onChanged: widget.Hint.contains("0.0")? widget.onChanged:null,
        keyboardType: widget.Hint.contains("Phone") ||widget.Hint.contains("0.0")? const TextInputType.numberWithOptions() : TextInputType.text,
        // maxLength: widget.Hint.contains("Enter Phone Number")? 10:null,
        validator: (value){
          if(value!.isEmpty) {
            return widget.Hint.contains("Name")
                ? "Enter UserName"
                : "Enter Phone Number";
          }else if(widget.Hint.contains("Enter Phone Number") && value.length!=10)
            {
              return "Enter Valid PhoneNumber";
            }
          return null;
        },
        controller: widget.Controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide.none
          ),
          hintText: widget.Hint,
          hintStyle: MyAppTextStyle().TextFeild_HintStyle,
        ),
      ),
    );
  }
}
