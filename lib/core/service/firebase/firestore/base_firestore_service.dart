import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirestoreService {
  
    FirebaseFirestore database = FirebaseFirestore.instance;

      Future validateCompanyId(int id);


}
