import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/symptoms_page.dart';
import 'package:hy_diabemate_fe/test.dart';

import 'Login_screen.dart';

class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(57, 7, 204, 178),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 74, 102, 95),
        centerTitle: true,
        title: Text(
          "Hy-Diabemate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Satisfy",
            fontSize: 35.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.05,
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border.all(color: Colors.black, width: 2.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://en.pimg.jp/068/860/774/1/68860774.jpg"),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle, // Set the shape to circle
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "Empowering you to conquer diabetes and live your best life.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Passion One",
                fontSize: 25.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}