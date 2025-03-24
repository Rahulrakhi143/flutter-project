import 'package:flutter/material.dart';
import 'package:my_project/Screen/slapServices.dart';
import 'package:my_project/Specific/AppColors.dart';


class Myslapscreen extends StatefulWidget {
  const Myslapscreen({super.key});

  @override
  State<Myslapscreen> createState() => _MyslapscreenState();
}

class _MyslapscreenState extends State<Myslapscreen> {
   MySlapService mySlapService = new MySlapService();

  void initState() {
    // TODO: implement initState
    super.initState();
    mySlapService.Screen(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image:
        DecorationImage(
            image: AssetImage("assets/images/Loading.png"),
            fit: BoxFit.cover
        ),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body:SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color:MyAppColor().LoadingProgressor,),
              Text("Loading",style:TextStyle(fontSize: 20,color: MyAppColor().TextColor)),
            ],
          ),
        ),
      ),
    );
  }
}
