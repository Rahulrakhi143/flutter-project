import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseHelper {
  Future<dynamic> getCustomerData() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      // Extract the user's email prefix
      var emailPrefix = _auth.currentUser?.email?.split('@').first;

      if (emailPrefix == null) {
        throw Exception("User email is not available.");
      }

      // Reference the specific node in the database
      final DatabaseReference ref = FirebaseDatabase.instance.ref(emailPrefix);
      final DataSnapshot snapshot = await ref.child("Costumer Data").get();

      // Check if data exists
      if (snapshot.value == null) {
        print("Null is type");
        return null;
      }

      // Safely cast the value
      final data = snapshot.value as Map<dynamic, dynamic>;
      print("Nulll");
      print(data);
       return data;
    } catch (e) {
      print("Error fetching customer data: $e");
    }
  }
}
