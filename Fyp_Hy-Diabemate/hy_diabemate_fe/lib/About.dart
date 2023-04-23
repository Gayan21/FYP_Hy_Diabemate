// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class About extends StatelessWidget {
   final String prediction;

  About({required this.prediction});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 155, 188, 176),
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
               // Image.asset
              image: DecorationImage(
                image: new AssetImage("lib/assets/images/result.png"),
              fit: BoxFit.fill,
                // image: NetworkImage(
                //     "https://www.flaticon.com/free-icon/type_9031996"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "Diabetes Predictor will help you find if you have diabetes or not",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "courier new",
                fontSize: 26.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "We are basically using Deep learning(DL) model behind the seen for predicting diabetes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "courier new",
                fontSize: 26.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
             child: Text(
   "Your prediction: ${this.prediction == '1' ? 'Positive' : 'Negative'}",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "courier new",
      fontSize: 26.0,
    ),
  ),
          ),
        ],
      ),
    );
  }
}