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
                    "https://livingwithamplitude.com/wp-content/uploads/2021/11/november-3-diabetes-awareness-1024x972.jpg"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "Help you to overcome the diabetese risk",
               textAlign: TextAlign.center,
              style: TextStyle(
                 color: Colors.white,
                
               
                
                fontSize: 26.0,
              ),
            ),
            
            
          ),
          Container(
            width: 50,
            padding:  EdgeInsets.all(55),  
            child: ElevatedButton( 
            
              style:  ElevatedButton.styleFrom(
    primary: Colors.greenAccent, 
    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                              width: 2, // thickness
                              color: Colors.white // color
                      ),
                      // border radius
                      borderRadius: BorderRadius.circular(16) 
              )// Background color
  ),
      
      
   
              child: new Text("Get Started"), 
              onPressed: () {
                Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  LoginScreen())
     
               );
              
              }, 
              // splashColor: Colors.redAccent,
              )
            
            
          ),
      
        ]
    )
    );
  }
}