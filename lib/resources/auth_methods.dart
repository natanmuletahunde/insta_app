import 'dart:typed_data'; // Import for Uint8List
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<String> signUpUser({ // Fix the method name typo
    required String email,
    required String password,
    required String name,
    required String bio,
    required Uint8List file, required String username, // Fix the typo from `unit8List` to `Uint8List`
  }) async {
    String res = "some error occurred"; // Fix typo in error message

    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty && bio.isNotEmpty && file != null) { // Fix conditional operators and variable name typo
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        res = 'success'; // Add `await` to the async call
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
