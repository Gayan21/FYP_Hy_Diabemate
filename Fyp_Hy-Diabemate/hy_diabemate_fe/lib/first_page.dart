import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/History_page.dart';
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
                  "https://livingwithamplitude.com/wp-content/uploads/2021/11/november-3-diabetes-awareness-1024x972.jpg"
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(50.0),
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
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2, // thickness
                    color: Colors.black, // color
                  ),
                  borderRadius: BorderRadius.circular(16.0),
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