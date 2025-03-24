import 'package:flutter/material.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/MyfontStyle.dart';



class MyElevetedButtonCircular extends StatefulWidget {
  final onPressed;
  final String Label;
  final Value;
  const MyElevetedButtonCircular({super.key,this.onPressed,this.Label="nal",this.Value});

  @override
  State<MyElevetedButtonCircular> createState() => _MyElevetedButtonCircularState();
}

class _MyElevetedButtonCircularState extends State<MyElevetedButtonCircular> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize:Size(88,46),
            backgroundColor:(widget.Value ? MyAppColor().ElevatedButtonBack1 : MyAppColor().ElevatedButtonBack2)),
        // onFocusChange: (widget.Label.contains("Login") || widget.Label.contains("Create Account"))? Null : ,
        onPressed: widget.onPressed,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon((widget.Label.contains("Home") ? Icons.home : widget.Label.contains("New") ? Icons.create_new_folder : widget.Label.contains("Baki") ? Icons.payment : Icons.map )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyAppTextStyle().MyText(context, widget.Label),
              ],
            ),
          ],
        )
    );
  }
}
