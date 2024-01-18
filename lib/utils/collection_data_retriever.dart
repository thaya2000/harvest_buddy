import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionDataRetrieverHelper {
  Future<Map<String, dynamic>> fetchCollectionData(
      String collectionName, String userId) async {
    try {
      final CollectionReference collection =
          FirebaseFirestore.instance.collection(collectionName);
      DocumentSnapshot collectionSnapshot = await collection.doc(userId).get();

      Map<String, dynamic> userData =
          collectionSnapshot.data() as Map<String, dynamic>;
      return userData;
    } catch (e) {
      print('Error fetching profile data: $e');
      return {};
    }
  }
}
