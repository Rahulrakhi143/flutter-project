import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_project/Special%20files/AuthTextFeilds/MyTextFeild.dart';
import 'package:library_project/Special%20files/Fluttertoast/Utils.dart';
import 'package:library_project/Special%20files/Stream%20Showdata/PopMenu/MyPopupMenuItem.dart';
import 'package:library_project/Special%20files/Stream%20Showdata/PopMenu/MyPopupmenuButton.dart';
import 'package:library_project/Special%20files/Stream%20Showdata/showMydilogueBox.dart';
import 'package:library_project/Special%20files/my_app_Text_style.dart';
import 'package:library_project/Special%20files/my_app_color.dart';

class Mystreambuilder {
  var DatabaseShow;
  String? Values = "";
  DilogBox dilogBox = DilogBox();
  Utils utils = Utils();
  var map1;

  Mystreambuilder(DatabaseReference Data) {
    this.DatabaseShow = Data;
  }

  Map MyMap() {
    return map1;
  }

  Widget Mystream({String? Value}) {
    Values = Value ?? Values;
    return Expanded(
      child: StreamBuilder<DatabaseEvent>(
        stream: DatabaseShow.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          try {
            final map = snapshot.data?.snapshot.value as Map<dynamic, dynamic>?;
            if (map == null || map.isEmpty) {
              return Center(child: Text('No data available'));
            }
            if(map.containsKey('student Data')) {
              map1 = map;
              final Map<dynamic, dynamic> Maps = map["student Data"];
              if (Maps == null) {
                return Center(child: Text('No student data available'));
              }

              List<dynamic> list = Maps.values.toList();
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  String? name = list[index]["Name"]?.toString();
                  if (name == null || name.isEmpty) {
                    return Text("");
                  }

                  if (Values != null &&
                      name.toLowerCase().contains(Values!.toLowerCase())) {
                    return _buildListContainer(context, list[index]);
                  } else if (Values == null) {
                    return _buildListContainer(context, list[index]);
                  }

                  return Container();
                },
              );
            }else{
              map1 = map;
              return Text("No Student Data");
            }

          } catch (e) {
            Fluttertoast.showToast(msg: 'Error: $e');
            return Center(child: Text('An error occurred!'));
          }
        },
      ),
    );
  }

  Widget _buildListContainer(context, dynamic list) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: MyAppColor().Stream_Container_Border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRow(
                  'Name',
                  list['Name'] ?? "N/A",
                ),
                _buildRow(
                  'Father Name',
                  list["Father's Name"] ?? "N/A",

                ),
                _buildRow(
                  "Phone No. ",
                  list['Phone'] ?? "N/A",
                ),
                _buildBooksRow(list['id']),
              ],
            ),
          ),
          SizedBox(width: 20),
          _buildPopupMenu(list, context),
        ],
      ),
    );
  }

  Widget _buildRow(String col1, String col2) {
    return Container(
      height: 24,
      child: Row(

        children: [
          SingleChildScrollView(scrollDirection: Axis.vertical,child: Expanded(child: Text(col1, style: MyAppTextStyle().StreamLableText))),
          SizedBox(width: 4,),
          SingleChildScrollView(scrollDirection: Axis.vertical,child: Expanded(child: Text(col2, style: MyAppTextStyle().StreamStudentData)))
        ],
      ),
    );
  }

  Future<void> _BuildPopupMenuForBook(context, String book, Map map, String id) async {
    int Value = 0;
    for (int i = 1; i < map.length; i++) {
      if (map["Book $i"] == book) {
        Value = i;
        break;
      }
    }
    return dilogBox.AlterDilog(
      context,
      book,
      Column(
        children: [
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Update"),
            onTap: () {
              Navigator.pop(context);
              ShowMyDilogueBoxUpdateBook(context, book, Value, id);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            onTap: () {
              Navigator.pop(context);
              ShowMyDilogBoxDeleteBook(context, book, Value, id);
            },
          ),
        ],
      ),
      [],
    );
  }

  Future<void> ShowMyDilogBoxDeleteBook(context, String book, int Value, String id) async {
    return dilogBox.AlterDilog(context, book, Text("Are you sure to delete"), [
      dilogBox.MyTextButton(() {
        Navigator.pop(context);
      }, "No"),
      dilogBox.MyTextButton(() {
        DatabaseShow.child('student Data').child(id).child("Book").child("Book $Value").remove().then((value) {
          Value--;
          DatabaseShow.child('student Data').child(id).child("Book").update({
            "id": Value
          });
          utils.Massage("$book is deleted");
          Navigator.pop(context);
        });
      }, "Yes")
    ]);
  }

  Future<void> ShowMyDilogueBoxUpdateBook(context, String Book, int Value, String id) async {
    TextEditingController BookUpdater = TextEditingController();
    BookUpdater.text = Book;

    return dilogBox.AlterDilog(
      context,
      "Update",
      MyTextField(Hint: "Enter Book Name", textLabel: "Book $Value", Controller: BookUpdater),
      [
        dilogBox.MyTextButton(() {
          if (BookUpdater.text.toString() == Book) {
            Navigator.pop(context);
            utils.Massage("Books not Updated");
          } else if (BookUpdater.text.isEmpty) {
            utils.Massage("Please Enter Book Name");
          } else {
            DatabaseShow.child('student Data').child(id).child("Book").update({
              "Book $Value": BookUpdater.text.toString(),
            }).then((value) {
              Navigator.pop(context);
              utils.Massage("Book Updated Successfully");
            }).onError((error, stackTrace) {
              Navigator.pop(context);
              utils.Massage(error.toString());
            });
          }
        }, "Update"),
        dilogBox.MyTextButton(() {
          Navigator.pop(context);
        }, "Cancel")
      ],
    );
  }
Future<void> UpdateStudentData(context,String id,String Name,String FatherName,String Phone)async{
    TextEditingController Names = TextEditingController();
    TextEditingController FatherNames = TextEditingController();
    TextEditingController Phones = TextEditingController();
    Names.text = Name;
    FatherNames.text =FatherName;
    Phones.text = Phone;
    dilogBox.AlterDilog(context,"Student Data", Column(
      children: [
        MyTextField(Hint: "Enter Name", textLabel: "Name", Controller: Names),
        MyTextField(Hint: "Enter Father Name", textLabel: "Father Name", Controller: FatherNames),
        MyTextField(Hint: "Enter Phone", textLabel: "Phone", Controller: Phones)
      ],
    ), [
      dilogBox.MyTextButton((){
        if(Names.text.isNotEmpty && FatherNames.text.isNotEmpty && Phones.text.isNotEmpty)
          {
            if(Names.text.toString() != Name || FatherNames.text.toString() != FatherName || Phones.text.toString() !=Phone){
              DatabaseShow.child("student Data").child(id).update({
                "Name":Names.text.toString(),
                "Father's Name": FatherNames.text.toString(),
                "Phone":Phones.text.toString(),
              }).then((value){
                Navigator.pop(context);
                utils.Massage("Data Updated");
              }).onError((e,stackTrace){
                utils.Massage(e.toString());
              });
            }else
              { Navigator.pop(context);
                utils.Massage("Data Not Updated");
              }
          }else {
          utils.Massage("Please Fill All");
        }
      }, "Update"),
      dilogBox.MyTextButton((){
        Navigator.pop(context);
      },"Cancel")
    ]);

}
Future<void> deleteData(context,String id,String Name) async {
    dilogBox.AlterDilog(context,Name,Text("Are you sure to delete"), [
        dilogBox.MyTextButton(() {
      Navigator.pop(context);
    }, "No"),
    dilogBox.MyTextButton(() {
      Navigator.pop(context);
    DatabaseShow.child('student Data').child(id).remove().then((value) {
    utils.Massage("Data is deleted");
    });
    },"Yes")
   ]);
  }

  Widget _buildBooksRow(String id) {
    return Row(
      children: [
        Text("Books", style: MyAppTextStyle().StreamStudentBooksLable),
        SizedBox(width: 10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder<DatabaseEvent>(
              stream: DatabaseShow.child('student Data').child(id).child('Book').onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                try {
                  final map = snapshot.data?.snapshot.value as Map<dynamic, dynamic>?;
                  if (map == null || map.isEmpty || map["id"] == 0) {
                    return Text('No books');
                  }
                  List<dynamic> list = map.values.toList();
                  return Row(
                    children: list
                        .map((book) => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _BuildPopupMenuForBook(context, book, map, id);
                          },
                          child: Text(book.toString()),
                        ),
                        Text(" "),
                      ],
                    ))
                        .toList(),
                  );
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                  return Text('Error loading books');
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> ShowMyDilogueBoxAddBook(context,String id, int Value) async {
    TextEditingController booksController = TextEditingController();

    return dilogBox.AlterDilog(context, "Add Book $Value",
        MyTextField(Hint: "Book $Value", textLabel: "Book $Value", Controller: booksController),
        [
          dilogBox.MyTextButton(() {
            if (booksController.text.isEmpty) {
              Navigator.pop(context);
              utils.Massage("Please Add Book Name");
            } else {
              DatabaseShow.child("student Data").child(id).child("Book").update({
                "Book $Value": booksController.text.toString(),
                "id": Value
              }).then((value) {
                Navigator.pop(context);
                utils.Massage("Book Added Successfully");
              }).onError((error, stackTrace) {
                Navigator.pop(context);
                utils.Massage(error.toString());
              });
            }
          }, "Add"),
          dilogBox.MyTextButton(() {
            if (booksController.text.isEmpty) {
              Navigator.pop(context);
              utils.Massage("Please Add Book Name");
            } else {
              DatabaseShow.child("student Data").child(id).child("Book").update({
                "Book $Value": booksController.text.toString(),
                "id": Value
              }).then((value) {
                Value++;
                Navigator.pop(context);
                ShowMyDilogueBoxAddBook(context, id, Value);
                utils.Massage("${booksController.text.toString()} Added Successfully");
              }).onError((error, stackTrace) {
                Navigator.pop(context);
                utils.Massage(error.toString());
              });
            }
          }, "Add More")
        ]);
  }

  Widget _buildPopupMenu(dynamic list, context) {
    return Mypopupmenu(
     Popup:[
       Mypopupmenuitem(title: 'Edit', icon: Icons.edit, onTap: (){
         Navigator.pop(context);
         UpdateStudentData(context, list['id'],list['Name'],list["Father's Name"],list['Phone']);
       }, Values: 1),
        Mypopupmenuitem(
          Values: 2,
          title: "Add Book",
          onTap: (){
            Navigator.pop(context);
              ShowMyDilogueBoxAddBook(context,list["id"],list["Book"]['id']+1);
          },
          icon: Icons.menu_book_outlined,
        ),
        Mypopupmenuitem(
          Values: 3,
          title: "Delete",
          onTap: (){
            Navigator.pop(context);
            deleteData(context,list['id'],list['Name']);
          },
          icon: Icons.delete,
        ),
      ],
    );
  }
}
