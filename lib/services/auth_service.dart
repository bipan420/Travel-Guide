import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/start_screen.dart';
import 'package:tourist_guide/user_details_page.dart';


class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  // static void signUpUser(BuildContext context, String name,String gender, String email, String password,  String chosenPackage,Timestamp travelDate) async {
  //   print('Email::::$email');
  //   try {
  //     final user = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     FirebaseUser signedInUser = user;
  //     if(signedInUser != null){
  //       _firestore.collection('users').document(signedInUser.uid).setData({
  //         'name':name,
  //         'email':email,
  //         'gender':gender,
  //         'password':password,
  //         'chosenPackage':chosenPackage,
  //         'travelDate': travelDate,
  //       }
  //       );
  //       //Navigator.pushNamed(context, UserDetailsPage.id);
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetailsPage()));
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  // }

  static logOutUser(BuildContext context){
    try{
    _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }catch(e){
      print(e);
    }
    
  }


  // static void loginUser(BuildContext context, String email, String password)async {
    
  //   try{
  //   final user = await _auth.signInWithEmailAndPassword(email: email,password: password);
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetailsPage()));
  //   }catch(e){
  //     print(e);
  //   }
    
    
  // }
}

