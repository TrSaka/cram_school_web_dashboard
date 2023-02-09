import 'package:flutter_school/core/service/firebase/firestore/base_firestore_service.dart';

class FirestoreService extends BaseFirestoreService {
  static FirestoreService? _instance;
  static FirestoreService? get instance {
    if (_instance == null) _instance = FirestoreService._init();
    return _instance;
  }

  FirestoreService._init();

  @override
  Future<bool> validateCompanyId(int id) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = database.collection("CRAM SCHOOL");
      var document = await collectionRef.doc(id.toString()).get();
      if (document.exists) {
        print("School was exist");
        return true; //if user's cram school is in database
      } else {
        return false; //if user's scram schools is not in the database
      }
    } catch (e) {
      rethrow; //for errors
    }
  }
}
