import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/models/user.dart' as model;
import 'package:instagram/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   
   Future<model.User> getUserDetails() async{
        User currentUser = _auth.currentUser!;

        DocumentSnapshot snap  = await _firestore.collection('users').doc(currentUser.uid).get();

        return model.User.fromSnap(snap);
   }
   
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      // Check if all fields are filled
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        
        // Create Firebase Auth User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // Upload profile image to Firebase Storage
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // Add user data to Firestore
      
      model.User user = model.User(
        
          username:username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl:photoUrl,
          following: [], 
          followers: [],
      );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);

        res = 'success';
      } else {
        res = 'Please fill in all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
   Future<void> signOut() async {
   await  _auth.signOut(); 
   }
}
