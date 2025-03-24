import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:library_project/Screens/AddPost.dart';
import 'package:library_project/Special%20files/Fluttertoast/Utils.dart';
import 'package:library_project/Special%20files/Padding/paddings.dart';
import 'package:library_project/Special%20files/SearchBar/MyAppSearchBar.dart';
import 'package:library_project/Special%20files/Stream%20Showdata/MystreamBuilder.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';
import 'package:library_project/Special%20files/my_app_color.dart';
import 'package:library_project/auth/Profile/profile.dart';

class MyHomePage extends StatefulWidget {
  final String CUser;
  const MyHomePage({super.key,required this.CUser});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String CurrentUser;
  Mystreambuilder? _mystreambuilder;
  late String Value;
  Map<dynamic,dynamic>? Maps;
  Utils utils = new Utils();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrentUser = widget.CUser;
    _mystreambuilder = Mystreambuilder(DatabaseShow);
  }
  get DatabaseShow => FirebaseDatabase.instance.ref(CurrentUser);

  String name="";
  TextEditingController SearchController = new TextEditingController();
  // List Userdata=[];
  // Future<void> GetRecord() async{
  //   try {
  //     String uri = "http://10.0.2.2/crud/view_data.php";
  //     var Response = await http.get(Uri.parse(uri));
  //     setState(() {
  //       Userdata = jsonDecode(Response.body);
  //     });
  //   }catch(e)
  //   {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   GetRecord();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyAppColor().AppBackGround,
        appBar: AppBar(title:Text("My Home Page",style: MyAppTextStyle().AppBarTextStyle,),
          backgroundColor: MyAppColor().AppBarBackGroundColor,
          actions: [

            IconButton(onPressed: (){
              setState(() {

                Maps = _mystreambuilder!.MyMap();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MyProfile(map: Maps,))).then((value){}).onError((e,stackTrace){
                      utils.Massage(e.toString());
                });
              });
              }, icon: Icon(Icons.person,color: MyAppColor().SignOut))
          ],
        ),floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPostAdd(DatabaseShow: DatabaseShow.child("student Data"))));
        }),
        body:Padding(
          padding:MyPadding().HomePage,
          child: Column(
              children: [
                MySearchBar(onChanged: (value){
                  setState(() {
                    _mystreambuilder!.Mystream(Value: value);
                  });
                }, controller: SearchController),
                Container(
                    child: _mystreambuilder!.Mystream()
                ),
              ]
          ),
        )
    );
  }
}
