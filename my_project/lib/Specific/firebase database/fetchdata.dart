import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_project/Specific/Error%20correction/flutter%20toast.dart';

Utils utils = Utils();
  // Todo user
  setCurrentCostumer(){
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User = _auth.currentUser;
    if(User !=null && User.email !=null) {
      final Cuser = User.email!;
      return Cuser.substring(0, Cuser.indexOf("@"));

    }else{
      return "";
    }
  }

getData(StateSetter setState) async{
  // final Cuser = setCurrentCostumer();
  Map<dynamic,dynamic> map = await GetCurrentUserDataMap();
  final data= map["User Data"];
  setState(() {
    return data;
  });
}


  // todo Current user Data
   GetCurrentUserDataMap() async {
    try {
      final Cuser=setCurrentCostumer();
      final DatabaseReference _databaseReference = await FirebaseDatabase.instance.ref(Cuser);
      final DataSnapshot snapshot = await _databaseReference.get();
      if(snapshot.exists){
         return await snapshot.value as Map<dynamic, dynamic>;
      }else{
        utils.ShowError("No data available at this path");
        return null;
      }
    } catch (error) {
      utils.ShowError("Error in Fetch");
      utils.ShowError(error.toString());
    }
   }
