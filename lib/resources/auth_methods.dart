import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

 Future<String> signUpUser({
  required String email,
  required String password,
  required String username,
  required String bio,
  required Uint8List file,
 }) async {
   String res = 'some error ocurred';
   try {
     if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
           UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
   }
   catch(err){
    res = err.toString();
   }
   return res;
 }
 }
}