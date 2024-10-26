import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async{
      String res  = 'some error ocucured ';
      try{
        if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty 
          ); 
       UserCredential cred =  await _auth.createUserWithEmailAndPassword(email: email, password: password);// used to create firebase auth using the email and password 
            print(cred.user!.uid);
        // create the firesore
        await _firestore.collection('users').doc(cred.user!.uid).set({
            'username': username,
            'uid':cred.user!.uid,
            'email': email,  // convert image to base64 format before storing in firebase firestore
            'bio': bio,
            'followers':[],
            'following':[],
  
        });
        res ='success';
        
      }
      catch(err){
    res = err.toString();
      }
      return res;
  } 
}

