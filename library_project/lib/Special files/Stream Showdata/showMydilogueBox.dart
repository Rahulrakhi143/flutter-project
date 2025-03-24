import 'package:flutter/material.dart';
import 'package:library_project/Special%20files/my_app_color.dart';

class DilogBox{
    void AlterDilog(context,String title,Widget content,List<Widget> action){
     showDialog(context: context, builder: (BuildContext context){
       return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: AlertDialog(title: Text(title),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               content,
             ],
           ),backgroundColor: MyAppColor().AlterDilogueBox_Color,
           actions:action,
         ),
       );
     });
     
    }
    ListTile MyList({String? title,IconData? icons,VoidCallback? onTap,String? subTitle}){
      return ListTile(
        title: Text(title!),
        subtitle: Text(subTitle!),
        leading: Icon(icons),
        onTap: onTap,
      );
    }
    TextButton MyTextButton(VoidCallback onPressed,String title){
      return TextButton(onPressed: onPressed, child: Text(title));
    }
}