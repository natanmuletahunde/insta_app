import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_methods.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
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
      String photoUrl = await   StorageMethods().uploadImageToStorage('profilePics', file, false);
        // create the firesore
        await _firestore.collection('users').doc(cred.user!.uid).set({
            'username': username,
            'uid':cred.user!.uid,
            'email': email,  // convert image to base64 format before storing in firebase firestore
            'bio': bio,
            'followers':[],
            'following':[],
            'photoUrl':photoUrl,
        });
        res ='success';
      }
      catch(err){
    res = err.toString();
      }
      return res;
  } 

  //  logging in user

  Future<String>loginUser({
    required String email,
    required String password,
  }) async {
    String res = ' some error occurred';
    try{
      if(  email.isNotEmpty || password.isNotEmpty ){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res ='success';
      }
      else {
        res ='please enter all the fields';
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
}


