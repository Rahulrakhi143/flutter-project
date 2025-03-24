
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_project/Screen/HomeScreen.dart';
import 'package:my_project/Screen/auth/MyProfile.dart';
import 'package:my_project/Specific/AppColors.dart';
import 'package:my_project/Specific/Error%20correction/flutter%20toast.dart';
import 'package:my_project/Specific/MyfontStyle.dart';
import 'package:my_project/Specific/Search%20and%20stream/Mystreambuilder.dart';
import 'package:my_project/Specific/TextField/MyAccountTextField.dart';
import 'package:my_project/Specific/TextField/TextField_cabja.dart';
import 'package:my_project/Specific/firebase%20database/fetchdata.dart';
import 'package:my_project/Specific/searchBar/MyAppSearchBar.dart';
import 'package:my_project/Specific/searchBar/paddings.dart';

var Newlist;
class MyHScreen {
  String selectedValue = "Current";
  String Cuser = "";
  String Total = "0";
  String Baki = "0";
  String totalBaki = "0";
  var selectList = "Left";
  var list12 = ["Single", "Double"];
  var list1= ["Left", "Right"];
  var list123 = ["With", "Without"];
  var data;


  TextEditingController controller = new TextEditingController();
  Widget MyMap(BuildContext context,List list,List CompleteList,List listController,List selectList1,List selectListWithOut,Map<String,dynamic>map) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {

          Widget DoubleDoorWithFrame(context,setState,index)
          {


            var Top = list[(1 + (selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6) * index).toInt()];
            var Left = list[(2 + (selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6) * index).toInt()];
            var Bottom = list[(3 + (selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6) * index).toInt()];
            var Right = list[(4 + (selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6) * index).toInt()];

            var A,C,B,D;
            if(selectListWithOut=="With") {
              A = list[(5 +
                  (selectListWithOut == "With" ? 4 : selectList1 == "Double"
                      ? 8
                      : 6) * index).toInt()];
              B = list[(6 +
                  (selectListWithOut == "With" ? 4 : selectList1 == "Double"
                      ? 8
                      : 6) * index).toInt()];
              C = list[(7 +
                  (selectListWithOut == "With" ? 4 : selectList1 == "Double"
                      ? 8
                      : 6) * index).toInt()];
              D = list[(8 +
                  (selectListWithOut == "With" ? 4 : selectList1 == "Double"
                      ? 8
                      : 6) * index).toInt()];
            }
            return Container(
              height: 500,
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(168,119, 166, 68),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectList1[index]),
                  // dropdown left and right
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: selectListWithOut[index],
                        items: list123.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            if(newValue=="With")
                              {
                               if( selectList1[index]=="Double")
                                 {
                                   list.removeLast();
                                   list.removeLast();
                                   list.removeLast();
                                   list.removeLast();
                                 }else{
                                 list.removeLast();
                                 list.removeLast();
                               }
                              }else{
                              if(selectList1[index]=="Double")
                                {
                                  final l = List.generate(4, (_)=>TextEditingController());
                                  list.addAll(l);
                                }else{
                                final l = List.generate(2, (_)=>TextEditingController());
                                list.addAll(l);
                              }
                            }
                            selectListWithOut[index] = newValue!;

                          });

                        },
                      ),
                      Row(
                        children: [
                          Text("Door Type"),
                          DropdownButton<String>(
                            value: selectList1[index],
                            items: list12.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectList1[index] = newValue!;
                              });

                            },
                          ),
                        ],
                      ),
                      selectList1[index]=="Single" ?
                      Row(
                        children: [
                          Text("Door Type"),
                          DropdownButton<String>(
                            value: selectList,
                            items: list1.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectList = newValue!;
                              });

                            },
                          ),
                        ],
                      ) : Container(),

                    ],
                  ),
                  // top
                  Container(
                    height: 50,
                    color: Colors.pink,
                    width: 300,
                    child: TextfieldCabja(
                      hint: "Top",
                      color: Colors.green,
                      Controller: Top,
                      onChanged: (value){

                        setState((){
                          list[0].text = value;
                        });
                      },
                      onTap: (){
                        setState((){
                          list[0].text = Top.text;
                        });
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 50,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //A
                            (selectList=="Left" || selectList1[index]=="Double") && selectListWithOut[index]=="Without" ? TextfieldCabja(
                              color: Colors.pink,
                              Controller: A,
                              hint: "A",
                              onChanged: (value){
                                list[0].text = value;
                              },
                              onTap: (){
                                list[0].text = A.text;
                              },
                            ) :Container(),
                            // Left
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.red,
                                child: TextfieldCabja(
                                  color: Colors.pink,
                                  hint: "Left",
                                  Controller: Left,
                                  onChanged: (value){
                                    list[0].text = value;
                                  },
                                  onTap: (){
                                    list[0].text = Left.text;
                                  },
                                ),
                              ),
                            ),
                            // B
                            selectListWithOut[index]=="Without" && (selectList=="Left" ||selectList1[index] =="Double")? TextfieldCabja(
                              color: Colors.pink,
                              Controller: B,
                              hint: "B",
                              onChanged: (value){
                                list[0].text = value;
                              },
                              onTap: (){
                                list[0].text = B.text;
                              },
                            ): Container(),

                          ],
                        ),
                      ),

                      Container(
                        color: Colors.blue,
                        height: 300,
                        width: 200,
                      ),


                      Container(
                        height: 300,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (selectList=="Right" || selectList1[index]=="Double") && selectListWithOut[index]=="Without"?TextfieldCabja(
                              color: Colors.pink,
                              Controller: D,
                              hint: "D",
                              onChanged: (value){
                                list[0].text = value;
                              },
                              onTap: (){
                                list[0].text = D.text;
                              },
                            ) : Container(),

                            // Right
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.red,
                                child:
                                TextfieldCabja(
                                  color: Colors.pink,
                                  Controller: Right,
                                  hint: "Right",
                                  onChanged: (value){
                                    list[0].text = value;
                                  },
                                  onTap: (){
                                    list[0].text = Right.text;
                                  },
                                ),
                              ),
                            ),
                            (selectList1[index] == "Double" || selectList=="Right") && selectListWithOut[index]=="Without"?
                            TextfieldCabja(
                              color: Colors.pink,
                              Controller: C,
                              hint: "C",
                              onChanged: (value){
                                list[0].text = value;
                              },
                              onTap: (){
                                list[0].text = C.text;
                              },
                            ): Container(),
                          ],
                        ),
                      ),

                    ],
                  ),

                  //  Bottom
                  Container(
                    height: 50,
                    color: Colors.pink,
                    width: 300,
                    child: TextfieldCabja(
                      color: Colors.green,
                      Controller: Bottom,
                      hint: "Bottom",
                      onChanged: (value){
                        setState((){
                          list[0].text = value;
                        });
                      },
                      onTap: (){
                        setState((){
                          list[0].text = Bottom.text;
                        });
                      },
                    ),
                  ),

                ],
              ),
            );
          }


         void addnewDoor(setState){



            final list32 = List.generate(selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6, (_)=>TextEditingController());
            setState(() {
              list.addAll(list32);
            });
            print("raj" + list.length.toString());
            print("r" + CompleteList.length.toString());

          }
          void AutoAdjust()
          {
            if(selectListWithOut.last=="With")
              {
                int length = list.length;

                if(list[length-4].text=="" && list[length-3].text==""&& list[length-2].text=="" && list[length-1].text=="")
                  {
                    list.removeLast();
                    list.removeLast();
                    list.removeLast();
                    list.removeLast();
                  }
              }
          }

          Future<void> addtofirebase() async{

            if(listController.isEmpty)
            {
              utils.ShowError("Fill User Details");
            }else{
              utils.ShowError("Saved");
            }

          }


          return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: MyAppColor().AppBarBackColor,
            title: MyAppTextStyle().MyTextB(context, "Map"),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 28),
                width: double.infinity,
                height: 100,
                color: MyAppColor().ElevatedButtonBack1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        MyAppTextStyle().MyTextB(context, "Name"),
                        const SizedBox(width: 10),
                        Myaccounttextfield(
                            Controller: listController[0],
                            Hint: "Enter Customer Name"),
                        Spacer(),
                        MyAppTextStyle().MyText(
                            context, "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}")
                      ],
                    ),
                    Row(
                      children: [
                        MyAppTextStyle().MyTextB(context, "Phone"),
                        const SizedBox(width: 10),
                        Myaccounttextfield(
                            Controller: listController[1],
                            Hint: "Enter Phone Number"),
                        ],
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: ListView.builder(itemCount: ((list.length-1)/(selectListWithOut=="With" ? 4 : selectList1=="Double" ? 8 : 6)).toInt(),itemBuilder: (context,index){
                  return DoubleDoorWithFrame(context, setState,index);
                })
              ),
              Container(
                color: MyAppColor().CurrentList,
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0115),
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  children: [
                    Container(
                      color: Colors.green,
                      child: Row(
                        children: [
                          Text("Currnet Text"),
                          SizedBox(width: 10,),
                          Text(list[0].text.toString()),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child:
                          Container(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              MyAppTextStyle().MyTextB(context, "Without Frame"),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectList1.add("Single");
                                        selectListWithOut.add("Without");
                                        addnewDoor(setState);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,

                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                    
                                      ),
                                      child: Text("One Door"),
                                    ),
                                  )),
                                  Expanded(child: InkWell(
                                    onTap: (){
                                      setState((){
                                        selectList1.add("Double");
                                        selectListWithOut.add("Without");
                                        addnewDoor(setState);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text("Double Door"),
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Window"),
                                  )),
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Chock Jali"),
                                  )),
                                ],
                              ),
                          
                            ],
                          )),
                        ),
                        Expanded(
                          child: Container(
                              child: Column(
                            children: [
                              MyAppTextStyle().MyTextB(context, "With Frame"),
                              Row(
                                children: [
                                  Expanded(child: Container(
                                    alignment:Alignment.center,
                                    child: Text("One Door"),
                                  )),
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Two Door"),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Window"),
                                  )),
                                  Expanded(child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        AutoAdjust();
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text("Save"),
                                    ),
                                  )),
                                ],
                              ),
                          
                            ],
                          )),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget Homescreen(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Home.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myprofile()));
                },
                icon: Icon(Icons.person_sharp))
          ],
          backgroundColor: MyAppColor().AppBarBackColor,
          title: MyAppTextStyle().MyTextB(context, "Home"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: MyPadding().HomePage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MySearchBar(
                  onChanged: (value) {},
                  controller: searchController,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget MyDropDownButton(BuildContext context) {
  //
  //   List<String> selectValue = ["Current", "Previous"];
  //   return StatefulBuilder(
  //     builder: (BuildContext context, StateSetter setState) {
  //       return DropdownButton<String>(
  //                               value: selectedValue,
  //                               items: selectValue.map((String value) {
  //                                 return DropdownMenuItem<String>(
  //                                   value: value,
  //                                   child: MyAppTextStyle().MyText(context, value),
  //                                 );
  //                               }).toList(),
  //                               onChanged: (String? newValue) {
  //                                 setState(() {
  //                                   selectedValue = newValue!;
  //                                 });
  //                               },
  //                             );
  //     },
  //   );
  // }

  Widget NewScreen(
      BuildContext context,
      List TextController,
      List QuentityController,
      List AmountController,
      List TotalController,
      double sum,
      TextEditingController JamaController,
      String PuranaBaki,
      TextEditingController CostumerName,
      TextEditingController CostumerPhone,
      String Cuser,
      String i,
      String ph,
      bool _value) {
    Utils utils = Utils();
    // FetchData fetchData = FetchData();
    bool Loading = false;
    var selectVelues = "Current";
    final List<String> selectValue = ["Current", "Previous"];
    // GlobalKey<FormState> _form = GlobalKey<FormState>();
    var id;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      void add() {
        TextEditingController C1 = TextEditingController();
        TextEditingController C2 = TextEditingController();
        TextEditingController C3 = TextEditingController();
        TextEditingController C4 = TextEditingController();
        if ((TextController.lastOrNull == null &&
                QuentityController.lastOrNull == null &&
                AmountController.lastOrNull == null) ||
            (TextController[TextController.length - 1].text.isNotEmpty ||
                AmountController[AmountController.length - 1].text.isNotEmpty ||
                QuentityController[QuentityController.length - 1]
                    .text
                    .isNotEmpty)) {
          setState(() {
            TextController.add(C1);
            QuentityController.add(C2);
            AmountController.add(C3);
            TotalController.add(C4);
          });
        } else {
          print("enter Data");
        }
      }

      void remove() {
        if (TextController.isNotEmpty) {
          setState(() {
            TextController.removeLast();
            QuentityController.removeLast();
            AmountController.removeLast();
            TotalController.removeLast();
          });
        } else {
          print("Empty");
        }
      }

      void total(var value, int index) {
        Total = value.toString().isEmpty
            ? "0"
            : (double.parse(QuentityController[index].text) *
                    double.parse(AmountController[index].text))
                .toString();
        TotalController[index].text = Total;
      }

      void totals() {
        // add();

        sum = 0;
        for (int i = 0; i < TotalController.length; i++) {
          sum = sum + double.parse(TotalController[i].text);
        }
        JamaController.text.toString().isEmpty
            ? {Baki = sum.toString(), JamaController.text = "0"}
            : Baki = (sum - double.parse(JamaController.text)).toString();
        PuranaBaki.isEmpty
            ? {totalBaki = Baki.toString(), PuranaBaki = "0.0"}
            : {
                totalBaki =
                    (double.parse(PuranaBaki) + double.parse(Baki)).toString()
              };
      }

      setData(final phone, final id) {
        setState(() {
          ph = phone;
          i = id;
        });
      }

      FetchPrevious() async {
        if (_value == false) {
          if (i.isNotEmpty && ph.isNotEmpty) {
            final map = await GetCurrentUserDataMap();
            setState(() {
              final map1 = map["Costumer Data"][ph][i];
              CostumerName.text = map1["Name"].toString();
              CostumerPhone.text = map1["Phone"].toString();
              for (int i = 0; i < ((map1.length - 6) / 3); i++) {
                TextEditingController C1 = TextEditingController();
                TextEditingController C2 = TextEditingController();
                TextEditingController C3 = TextEditingController();
                TextEditingController C4 = TextEditingController();
                C1.text = map1["Item ${i}"].toString();
                TextController.add(C1);
                C2.text = map1["Amount ${i}"].toString();
                AmountController.add(C2);
                C3.text = map1["kg ${i}"].toString();
                QuentityController.add(C3);
                C4.text = (double.parse(map1["Amount ${i}"]) *
                        double.parse(map1["kg ${i}"]))
                    .toString();
                TotalController.add(C4);
              }
            });
          } else {
            setState(() {
              selectedValue = "Current";
              selectVelues = "Current";
              utils.ShowError("No Previous Data");
            });
          }
        }
      }

      Future<void> AddCostumerData(String id, int value) async {
        try {
          while (true) {
            if (TextController[TextController.length - 1].text.isNotEmpty ||
                AmountController[AmountController.length - 1].text.isNotEmpty ||
                QuentityController[QuentityController.length - 1]
                    .text
                    .isNotEmpty) {
              break;
            } else {
              remove();
            }
          }

          FirebaseAuth _auth = FirebaseAuth.instance;
          var s = _auth.currentUser!.email;
          s = s!.substring(0, s.indexOf("@"));

          final ref = await FirebaseDatabase.instance.ref(s);
          // fetchData.fetchCostumerName(setState, s);
          // final DataSnapshot snapshot = await ref.child("Costumer Data").child(CostumerPhone.text).get();
          // final data  = snapshot.value as Map<dynamic,dynamic>;
          await ref
              .child("Costumer Data")
              .child(CostumerPhone.text)
              .child(id)
              .set({
            "Name": CostumerName.text.toString(),
            "id": id,
            "Jama": JamaController.text,
            "Phone": CostumerPhone.text,
            for (int i = 0; i < TextController.length; i++)
              "Item $i": TextController[i].text.toString(),
            for (int i = 0; i < QuentityController.length; i++)
              "kg $i": QuentityController[i].text.toString(),
            for (int i = 0; i < AmountController.length; i++)
              "Amount $i": AmountController[i].text.toString(),
            "Purana Baki": PuranaBaki,
            "Value": value.toString(),
            "Day":
                "${"${DateTime.now().day}" "-" "${DateTime.now().month}" "-" "${DateTime.now().year}"}",
            "Time":
                "${"${DateTime.now().hour}" "-" "${DateTime.now().minute}" "-" "${DateTime.now().second}"}"
          }).then((value) {
            ref
                .child("Costumer Data")
                .child("Costumer Name")
                .child(CostumerPhone.text)
                .set({
              "Name": CostumerName.text.toString(),
              "Purana Baki": PuranaBaki,
              "id": CostumerPhone.text
            }).then((value) {
              setData(CostumerPhone.text, id);
              setState(() {
                CostumerPhone.text = "";
                CostumerName.text = "";
                PuranaBaki = "0.0";
                Baki = "0.0";
                totalBaki = "0.0";
                Total = "0";
                sum = 0.0;
                TextController.clear();
                TotalController.clear();
                QuentityController.clear();
                AmountController.clear();
                JamaController.clear();
                Loading = false;
              });
              utils.ShowError("Data Edded");
            }).onError((e, StackTrace) {
              setState(() {
                Loading = false;
              });
              ref
                  .child("Costumer Data")
                  .child(CostumerPhone.text)
                  .child(id)
                  .remove()
                  .then((value) {
                utils.ShowError("Error to Edded");
              });
            });
          }).onError((e, StackTrace) {
            setState(() {
              Loading = false;
            });
            utils.ShowError(e.toString());
          });
        } catch (e) {
          setState(() {
            Loading = false;
          });
          utils.ShowError(e.toString());
        }
      }

      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  // TODO implement share
                },
                child: MyAppTextStyle().MyText(context, "share"),
              ),
            ],
            backgroundColor: MyAppColor().AppBarBackColor,
            title: MyAppTextStyle().MyText(context, "Account"),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              child: Column(
                children: [
                  // TODO costumer bar
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 28),
                    width: double.infinity,
                    height: 100,
                    color: MyAppColor().ElevatedButtonBack1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            MyAppTextStyle().MyTextB(context, "Name"),
                            const SizedBox(width: 10),
                            Myaccounttextfield(
                                Controller: CostumerName,
                                Hint: "Enter Customer Name"),
                            Spacer(),
                            MyAppTextStyle().MyText(
                                context,
                                _value == false
                                    ? "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
                                    : i)
                          ],
                        ),
                        Row(
                          children: [
                            MyAppTextStyle().MyTextB(context, "Phone"),
                            const SizedBox(width: 10),
                            Myaccounttextfield(
                                Controller: CostumerPhone,
                                Hint: "Enter Phone Number"),
                            Spacer(),
                            DropdownButton<String>(
                              value: selectedValue,
                              items: selectValue.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child:
                                      MyAppTextStyle().MyText(context, value),
                                );
                              }).toList(),
                              onChanged: _value == false
                                  ? (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                        selectVelues = selectedValue;
                                      });

                                      if (selectVelues == "Previous") {
                                        FetchPrevious();
                                      }
                                    }
                                  : null,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 22,
                          padding: const EdgeInsets.only(left: 10),
                          color: MyAppColor().AccountItems,
                          child: Row(
                            children: [
                              MyAppTextStyle().MyText(context, "Item"),
                              Spacer(),
                              MyAppTextStyle().MyText(context, "kg"),
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.07),
                              MyAppTextStyle().MyText(context, "Amount"),
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.05),
                              MyAppTextStyle().MyText(context, "total"),
                              SizedBox(width: 35)
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                TextController.length, // Dummy data for example
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Myaccounttextfield(
                                        Controller: TextController[index],
                                        Hint: "Null"),
                                    Myaccounttextfield(
                                      Hint: "0.0",
                                      Controller: QuentityController[index],
                                      onChanged: (value) {
                                        try {
                                          setState(() {
                                            total(value, index);
                                          });
                                        } catch (e) {
                                          utils.ShowError("Enter Amount");
                                        }
                                      },
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    Myaccounttextfield(
                                      Hint: "0.0",
                                      onChanged: (value) {
                                        try {
                                          setState(() {
                                            total(value, index);
                                          });
                                        } catch (e) {
                                          utils.ShowError(e.toString());
                                        }
                                      },
                                      Controller: AmountController[index],
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    MyAppTextStyle().MyText(
                                        context, TotalController[index].text),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      color: MyAppColor().AccountItems,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyAppTextStyle().MyText(context, "Jama"),
                                Spacer(),
                                Myaccounttextfield(
                                  Controller: JamaController,
                                  Hint: "0.0",
                                  onChanged: (value) {
                                    // todo implement jamacontroller
                                    setState(() {
                                      totals();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: MyAppColor().CurrentList,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO Implement
                                    add();
                                  },
                                  child: MyAppTextStyle()
                                      .MyText(context, "New Item"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        MyAppColor().ElevatedButtonBack1,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO Implement
                                    remove();
                                  },
                                  child: MyAppTextStyle()
                                      .MyText(context, "Delete Item"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        MyAppColor().ElevatedButtonBack1,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // todo implement Calculate

                                    setState(() {
                                      totals();
                                    });
                                  },
                                  child: MyAppTextStyle()
                                      .MyText(context, "Calculate"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        MyAppColor().ElevatedButtonBack1,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Loading = true;
                                      print(Loading);
                                      totals();
                                      _value == false
                                          ? id =
                                              DateTime.now().second.toString()
                                          : id = Cuser;
                                    });
                                    if (CostumerName.text.isEmpty &&
                                        CostumerPhone.text.isEmpty) {
                                      utils.ShowError("Fill costumer detail");
                                      setState(() {
                                        Loading = false;
                                      });
                                    } else {
                                      AddCostumerData(id, 0);
                                    }
                                    print(Loading);
                                  },
                                  child: Loading == false
                                      ? MyAppTextStyle().MyText(context, "Save")
                                      : CircularProgressIndicator(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        MyAppColor().ElevatedButtonBack1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              // alignment: Alignment.center,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.0125,
                                  right: MediaQuery.of(context).size.height *
                                      0.03125),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle()
                                          .MyText(context, "Through"),
                                      Spacer(),
                                      Myaccounttextfield(
                                        Hint: "Name",
                                      )
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle()
                                          .MyText(context, "Total Ammount"),
                                      Spacer(),
                                      MyAppTextStyle().MyText(context, "$sum")
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle().MyText(context, "Jama"),
                                      Spacer(),
                                      MyAppTextStyle().MyText(context, JamaController.text)
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle().MyText(context, "Baki"),
                                      Spacer(),
                                      MyAppTextStyle().MyText(context, "$Baki")
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle()
                                          .MyText(context, "Purana Baki"),
                                      Spacer(),
                                      MyAppTextStyle()
                                          .MyText(context, "$PuranaBaki")
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MyAppTextStyle()
                                          .MyText(context, "Total Baki"),
                                      Spacer(),
                                      MyAppTextStyle()
                                          .MyText(context, "$totalBaki")
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget BakiScreen(BuildContext context, bool value,
      TextEditingController searchController, Dt) {
    Mystreambuilder mystreambuilder = Mystreambuilder();
    mystreambuilder.search(searchController.text);

    try {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Home.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: MyAppColor().AppBarBackColor,
                title: MyAppTextStyle().MyText(context, "Costumer List"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      color: mystreambuilder.Change()
                          ? MyAppColor().ElevatedButtonBack1
                          : Colors.transparent,
                      child: mystreambuilder.Change()
                          ? Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 28),
                              width: double.infinity,
                              height: 100,
                              color: MyAppColor().ElevatedButtonBack1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      MyAppTextStyle().MyTextB(
                                          context,
                                          mystreambuilder.CostumerName()
                                              .toString()),
                                      const Spacer(),
                                      MyAppTextStyle().MyText(context,
                                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}")
                                    ],
                                  ),
                                  MyAppTextStyle().MyTextB(
                                      context,
                                      mystreambuilder.CostumerPhone()
                                          .toString()),
                                ],
                              ),
                            )
                          : MySearchBar(
                              onChanged: (value) {
                                // TODO Search control
                                // print(Data["Costumer Data"]["Costumer Name"]);
                                // print(Data["Costumer Data"]["Costumer Phone"]);

                                // if(Data["Costumer Data"]["Costumer Name"].toString().contains(searchController.text.toString()))
                                //   {
                                setState(() {
                                  mystreambuilder.GetValue(
                                      searchController.text);
                                });
                                //   }
                              },
                              controller: searchController,
                            ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.888,
                        child: mystreambuilder.Mystream(
                            setState,
                            mystreambuilder.Change()
                                ? FirebaseDatabase.instance
                                    .ref(Dt)
                                    .child("Costumer Data")
                                    .child(mystreambuilder.CostumerPhone()
                                        .toString())
                                : FirebaseDatabase.instance
                                    .ref(Dt)
                                    .child("Costumer Data")
                                    .child("Costumer Name")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      return Container();
    }
  }
}
