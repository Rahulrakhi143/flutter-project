import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mypopupmenu extends StatefulWidget {
 final List<PopupMenuEntry<dynamic>> Popup;
  const Mypopupmenu({super.key,required this.Popup});

  @override
  State<Mypopupmenu> createState() => _MypopupmenuState();
}

class _MypopupmenuState extends State<Mypopupmenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton(
          itemBuilder:(context){
        return widget.Popup;
      }
      ),
    );
  }
}
