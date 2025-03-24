import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyRoundedButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  Color BackGroundColor;
  bool Loading;
  MyRoundedButton({super.key, required this.label,this.Loading = false,required this.onTap,this.BackGroundColor = Colors.red});

  @override
  State<MyRoundedButton> createState() => _MyRoundedButtonState();
}

class _MyRoundedButtonState extends State<MyRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          child: widget.Loading?SizedBox(height:15,width:15,child: CircularProgressIndicator(strokeWidth: 3,)):Text(widget.label),
          decoration: BoxDecoration(
            color: widget.BackGroundColor,
            border:Border.all(),
            borderRadius:BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }
}