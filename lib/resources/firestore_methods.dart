import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/resources/storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPost(
    String description,
    String file,
     String uid,
  ) async {
   
    String res = 'some error occurred';
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);
    } catch (err) {
     
    }
  }
}
