import 'package:flutter/material.dart';

import 'Login_screen.dart';



class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "First page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // fontFamily: "courier new",
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
                
               
                
                fontSize: 26.0,
              ),
            ),
            
            
          ),
          Container(
            padding:  EdgeInsets.all(15),  
            child: MaterialButton( 
              height: 40.0, 
              minWidth: 40.0, 
              color: Colors.greenAccent, 
              textColor: Colors.white, 
              child: new Text("Get Started"), 
              onPressed: () {
                Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  Login())
     
               );
              
              }, 
              splashColor: Colors.redAccent,
              )
            
            
          ),
      
        ]
    )
    );
  }
}