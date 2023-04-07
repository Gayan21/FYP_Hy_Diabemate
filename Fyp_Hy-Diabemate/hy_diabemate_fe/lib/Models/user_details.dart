import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';
import 'package:flutter/material.dart';

class AuthService  {
  String ? userName;
  String ? userPwd;


//  DocumentReference documentReference;
AuthService({required this.userName,required this.userPwd});
 
 toJson(){
  return {'userName': userName , 'userPwd': userPwd};
 }
  // wrapping the firebase calls
  // Future createUser(
  //     {String firstName,
  //     String lastName,
  //     String email,
  //     String password}) async {}

  // // logs in the user if password matches
  // Future loginUser({String email, String password}) {
  //   if (password == 'password123') {
  //     this.currentUser = {'email': email};
  //     notifyListeners();
  //     return Future.value(currentUser);
  //   } else {
  //     this.currentUser = null;
  //     return Future.value(null);
  //   }
  // }
}