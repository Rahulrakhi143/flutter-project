import 'package:flutter/material.dart';
import 'package:my_project/Screen/Home.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/buttons/ElevatedButtonCircular.dart';
import 'package:my_project/Specific/firebase%20database/fetchdata.dart';


class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
int _currentIndex = 0; // Track the selected tab index
final TextEditingController _searchController = TextEditingController();
final List _TextController = [];
final List _Quntity = [];
final List _Amount = [];
final List _Total = [];
var _Cuser = "";
final List _CompleteList =[];
final List _selectList = [];
var _list = List.generate(1, (_)=>TextEditingController());
var _listController = List.generate(2, (_)=>TextEditingController());
final Map<String,dynamic> map={};


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
       _Cuser = setCurrentCostumer();
    });
}
final TextEditingController _JamaController = new TextEditingController();
final TextEditingController _CostumerName = new TextEditingController();
final TextEditingController _CostumerPhone = new TextEditingController();


var _PuranaBaki = "0.0";
double _sum=0.0;
var _Value0 = false;
var _Value1 = true;
var _Value2 = true;
var _Value3 = true;
var _i ="",_ph="";
final _value = false;
final List _selectList1=[];
// setDatas(String i,String ph){
//   this.i=i;
//   this.ph = ph;
// }

//   List of widget screens to display for each tab
List<Widget> _getScreens(BuildContext context) {
    return [
      MyHScreen().Homescreen(context),
      MyHScreen().NewScreen(context,_TextController,_Quntity,_Amount,_Total,_sum,_JamaController,_PuranaBaki,_CostumerName,_CostumerPhone,_Cuser,_i,_ph,_value),
      MyHScreen().BakiScreen(context,false,_searchController,_Cuser),
      MyHScreen().MyMap(context,_list,_CompleteList,_listController,_selectList,_selectList1,map)
    ];
  }

// Method to handle button press and change screen
  void _onButtonPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreens(context)[_currentIndex], // Display selected screen
      bottomNavigationBar: Container(
        color: MyAppColor().ElevatedButtonBack1,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyElevetedButtonCircular(
             Label: "Home",
             Value: _Value0,
             onPressed: (){
               _onButtonPressed(0);
               setState(() {
                 _Value0 = false;
                 _Value1 = true;
                 _Value2 = true;
                 _Value3 = true;
               });
             },
           ),
            MyElevetedButtonCircular(
              Label: "New",
              Value: _Value1,
              onPressed: (){
                _onButtonPressed(1);
                setState(() {
                  _Value0 = true;
                  _Value1 = false;
                  _Value2 = true;
                  _Value3 = true;
                });
              },
            ),
            MyElevetedButtonCircular(
              Label: "Baki",
              Value: _Value2,
              onPressed: (){
                _onButtonPressed(2);
                setState(() {
                  _Value0 = true;
                  _Value1 = true;
                  _Value2 = false;
                  _Value3 = true;
                });
              },
            ),
            MyElevetedButtonCircular(
              Label: "Map",
              Value: _Value3,
              onPressed: (){
                _onButtonPressed(3);
                setState(() {
                  _Value0 = true;
                  _Value1 = true;
                  _Value2 = true;
                  _Value3 = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
