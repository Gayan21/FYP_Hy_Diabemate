import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/About.dart';
import 'package:http/http.dart' as http;
import 'package:hy_diabemate_fe/first_page.dart';
import 'Profile.dart';

import 'Login_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prediction_page(),
    );
  }
}


// ignore: avoid_init_to_null
var result = null;
var pregnant;
var glucose;
var bloodpressure;
var skin;
var insulin;
var mass;
var diabetes;
var age;



class Prediction_page extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Prediction_page>{
   var pregnant = TextEditingController();
  // final TextEditingController pregnant = new TextEditingController();
  // final TextEditingController pregnant = new TextEditingController();
  // final TextEditingController pregnant = new TextEditingController();
  ag()  async{
    var r = await http.get(
    Uri.http(
      "192.168.99.100",
      "cgi-bin/diabetes.py",
      {
        "pregnant": pregnant,
        "glucose": glucose,
        "bloodpressure": bloodpressure,
        "skin": skin,
        "insulin": insulin,
        "mass": mass,
        "diabetes": diabetes,
        "age": age
      },
    ),
  );
  setState(() {
    result = r.body;
  });
}

  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.green,
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        child: Center(
          child: IconButton(
            mouseCursor:MouseCursor.defer,
            alignment: Alignment.topRight,
            iconSize: 2.0,
            onPressed: ag,
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ), 
          ),
        ),
      ),
      appBar: AppBar(
         backgroundColor: Colors.greenAccent,
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),

        // leading : CircleAvatar(
          
        //   backgroundColor: Colors.transparent,
        //   child: IconButton(
        //     alignment: Alignment.topLeft,
        //     onPressed: () => showDialog(
        //       context: context,
        //       builder: (BuildContext context) => SimpleDialog(
        //         backgroundColor: Colors.white,
        //         title: Text(
        //           "Hy-Diabemate",
                   
        //           style: TextStyle(
        //             letterSpacing: 1.0,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 26.0,
        //             fontFamily: "courier new",

        //           ),
        //         ),
        //         //                        About 
        //         children: [  
        //           Column(
        //             children: [
        //               Card(
        //                 color: Colors.blueAccent,
        //                 shadowColor:Colors.grey,
        //                 borderOnForeground: true,
        //                 child:ListTile(
        //                   trailing:IconButton(
        //                     onPressed: ()=> Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                         builder:(context)=> Profile(),
        //                       ),
        //                     ),
        //                     icon: Icon(Icons.apps_rounded),
        //                   ),
        //                   title: Text(
        //                     "About App",
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 20.0,
        //                       fontFamily: "courier new,"
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //     icon: Icon(
        //       Icons.contacts,
        //       color: Colors.black,
        //       size: 35.0,
        //     ),
        //   ),
        // ),
        title: Center(
          child: Text(
            "Hy-Diabemate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Satisfy",
              fontSize: 30.0,
            ),
          ),
        ),
        actions: [
        
    CircleAvatar(
          
          backgroundColor: Colors.transparent,
          child: IconButton(
            padding: EdgeInsets.all(5),
            alignment: Alignment.topLeft,
          // color: Colors.white,
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                backgroundColor: Colors.white,
                title: Text(
                  "Hy-Diabemate",
                   
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    fontFamily: "courier new",

                  ),
                ),
                //                        About 
                children: [  
                  Column(
                    children: [
                      Card(
                        color: Colors.blueAccent,
                        shadowColor:Colors.grey,
                        borderOnForeground: true,
                        child:ListTile(
                          trailing:IconButton(
                            onPressed: ()=> Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=> Profile(),
                              ),
                            ),
                            icon: Icon(Icons.apps_rounded),
                          ),
                          title: Text(
                            "About App",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: "courier new,"
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            icon: Icon(
              
              Icons.contacts,
              color: Colors.white,
              size: 35.0,
            ),
          ),
        ),
  ],
      ),

        //                     BODY 
      body: Container(
        color: Colors.white30,
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                    //                               RESULT(output)
                  Text(
                      // ignore: unnecessary_brace_in_string_interps
                    "Result: ${result}",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: "courier new",
                        fontSize:20.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: SafeArea(
                        child: ListView(
                          children: [
                            Card(
                              color: Colors.white38,
                              child: TextField(
                                controller: pregnant,
                                keyboardType:
                                TextInputType.numberWithOptions(decimal:true ) ,
                                // onChanged: (pg) => pregnant = pg ,
                                style: TextStyle(
                                  fontFamily: "courier new",
                                  fontSize:24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(hintText: "Number of time pregnant",
                                suffixIcon: IconButton(
      onPressed: pregnant.clear,
      icon: Icon(Icons.clear),
    ),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (gl) => glucose = gl,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Glucose Concentration" ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (bp) => bloodpressure = bp,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Diastolic Blood Pressure(mm Hg)" ),
                              ),
                            ),
                              Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (sk) => skin = sk,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Tricep skin fold thickness (mm)" ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (il) => insulin = il,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "2-Hour Serum insulin(mu U/ml)" ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (ma) => mass = ma,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Body mass index" ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (db) => diabetes = db,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Body mass index" ),
                              ),
                            ),
                            Card(
                              color: Colors.blueGrey,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (ag) => age = ag,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:InputDecoration(hintText: "Age" ),
                              ),
                            ),
                            ListTile(
          title: Row(
            children: <Widget>[
              Expanded(child: ElevatedButton(onPressed: () {
        //         "pregnant": pregnant,
        // "glucose": glucose,
        // "bloodpressure": bloodpressure,
        // "skin": skin,
        // "insulin": insulin,
        // "mass": mass,
        // "diabetes": diabetes,
        // "age": age
                // _formKey.currentState.reset();
                setState(() {
                    pregnant.clear();
              glucose.clear();
              bloodpressure.clear();
             bloodpressure.clear();
              skin.clear();
              insulin.clear();
             mass.clear();
              diabetes.clear();
                  
                });
            
              },child: Text("Reset"),
                style: ElevatedButton.styleFrom(
    primary: Colors.black, // Background color
    onPrimary: Colors.white, // Text Color (Foreground color)
  ),
          //     color: Colors.black,
          //     textColor: Colors.white,
          //     shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
            
          // )
          )
              ) ,
              SizedBox(width: 10,),
              Expanded(child: ElevatedButton(onPressed: () {
                 Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  About())
                      
                                );
              },
              
             child: Text("Predict"),
             style: ElevatedButton.styleFrom(
    primary: Colors.greenAccent, // Background color
    onPrimary: Colors.white, // Text Color (Foreground color)
  ),
          //    color: Colors.greenAccent,textColor: Colors.white,
          //    shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
            
          // )
          )),
            ],
          ),
        )
                        //     Container(
                        //         height: 50,
                        //         width: 250,
                        //         decoration: BoxDecoration(
                        //             color: Colors.greenAccent, borderRadius: BorderRadius.circular(20)),
                        //         // ignore: deprecated_member_use
                        //         child: FlatButton(
                        //           onPressed: () {
                                    
                        //           Navigator.of(context).push(
                        // MaterialPageRoute(builder: (context) =>  About())
                      
                        //         );
                                
                              
                        //           },
                        //           child: Text(
                        //             'Predict',
                        //             style: TextStyle(color: Colors.white, fontSize: 25),
                                    
                        //           ),
                        //         ),
                        //       ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            );
          }
        ),
        ),
      );
  }
}