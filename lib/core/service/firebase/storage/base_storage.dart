import 'package:firebase_storage/firebase_storage.dart';
import '../../../../models/exam_model.dart';

abstract class BaseFirebaseStorage {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future? fetchDefaultProfilePic();

  Future storeExamTxtFile(ExamModel model,String txtName);
}
