import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileHelper {
  final CollectionReference farmersCollection =
      FirebaseFirestore.instance.collection("farmers");

  final user = FirebaseAuth.instance.currentUser!;

  Future<Map<String, dynamic>> fetchUserProfile() async {
    try {
      DocumentSnapshot userSnapshot =
          await farmersCollection.doc(user.uid).get();
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      return userData;
    } catch (e) {
      print('Error fetching profile data: $e');
      return {};
    }
  }
}
