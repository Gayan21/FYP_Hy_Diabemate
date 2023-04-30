// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/About.dart';
import 'package:http/http.dart' as http;
import 'package:hy_diabemate_fe/first_page.dart';
import 'Profile.dart';

import 'Login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: First_Page(),
    )
  );
}

