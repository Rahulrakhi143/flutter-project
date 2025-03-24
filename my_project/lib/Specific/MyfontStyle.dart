

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_project/Specific/AppColors.dart';

class MyAppTextStyle {
 final TextFeild_HintStyle= TextStyle(fontSize: 15,color: MyAppColor().HintColor);
 final AppBarTextStyle = TextStyle(fontSize: 20,color: MyAppColor().AppTextColor);
 final TextHeading = TextStyle(color: MyAppColor().TextHeadingColor,fontSize: 30);
 final LableTextStyle = TextStyle(color: MyAppColor().Text1,fontSize: 20);
 final lowerText2 = TextStyle(color: MyAppColor().slapText1,fontSize: 20);
 final LowestText3 = TextStyle(color: MyAppColor().Text3,fontSize: 20);
 final TextButtonStyle = TextStyle(color: MyAppColor().AuthButtonColor,fontSize: 20);
 final StreamLableText =  TextStyle(color: MyAppColor().Stream_text_Lable,fontSize: 18);
 final StreamStudentData = TextStyle(color: MyAppColor().Stream_text_UserData,fontSize: 20);
 final StreamStudentBooksLable = TextStyle(color: MyAppColor().Stream_text_Lable,fontSize: 18);
 final LogOutText = TextStyle(color: MyAppColor().LogOut_color,fontSize: 20);
 final ProfileText = TextStyle(color: MyAppColor().ProfileTextColor,fontSize: 18);



 // TODO NEW
 final LoginAccount = TextStyle(fontSize:20,color: MyAppColor().TextColor);
 Text MyText(BuildContext context,String Label)
 {
  return Text(
   Label,
   style: TextStyle(
    color: MyAppColor().TextColor,
    fontSize: 12,
   ),
  );
 }

 Text MyTextB(BuildContext context,String Label)
 {
  return Text(
   Label,
   style: TextStyle(
    color: MyAppColor().TextColor,
    fontSize: 12,
    fontWeight: FontWeight.bold
   ),
  );
 }
 Text MyTextL(BuildContext context,String Label)
 {
  return Text(
   Label,
   style: TextStyle(
       color: Colors.white,
       fontSize: 12,
       fontWeight: FontWeight.bold
   ),
  );
 }
}