import 'package:flutter/material.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/MyfontStyle.dart';


class MyElevetedButton extends StatefulWidget {
  final onPressed;
  final String Label;
  bool Loading;
  MyElevetedButton({super.key,this.onPressed,this.Label="nal",this.Loading= true,});

  @override
  State<MyElevetedButton> createState() => _MyElevetedButtonState();
}

class _MyElevetedButtonState extends State<MyElevetedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        fixedSize:Size(MediaQuery.of(context).size.width,52),
            backgroundColor:MyAppColor().ElevatedButtonBack,
        ),
        // onFocusChange: (widget.Label.contains("Login") || widget.Label.contains("Create Account"))? Null : ,
        onPressed: widget.onPressed,
        child: widget.Loading ? Center(child: CircularProgressIndicator(color: Colors.white,),
        ):MyAppTextStyle().MyTextL(context, widget.Label)
    );
  }
}
