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

// // ignore: avoid_init_to_null
// var result = null;
// var pregnant;
// var glucose;
// var bloodpressure;
// var skin;
// var insulin;
// var mass;
// var diabetes;
// var age;



// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp>{
//   ag()  async{
//     var r = await http.get(
//     Uri.http(
//       "192.168.99.100",
//       "cgi-bin/diabetes.py",
//       {
//         "pregnant": pregnant,
//         "glucose": glucose,
//         "bloodpressure": bloodpressure,
//         "skin": skin,
//         "insulin": insulin,
//         "mass": mass,
//         "diabetes": diabetes,
//         "age": age
//       },
//     ),
//   );
//   setState(() {
//     result = r.body;
//   });
// }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Colors.green,
//       floatingActionButton: CircleAvatar(
//         backgroundColor: Colors.white,
//         child: Center(
//           child: IconButton(
//             mouseCursor:MouseCursor.defer,
//             iconSize: 29.0,
//             onPressed: ag,
//             icon: Icon(
//               Icons.search,
//               color: Colors.black,
//               size: 30.0,
//             ), 
//           ),
//         ),
//       ),
//       appBar: AppBar(
//          backgroundColor: Colors.greenAccent,
//         leading: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           child: IconButton(
//             alignment: Alignment.topLeft,
//             onPressed: () => showDialog(
//               context: context,
//               builder: (BuildContext context) => SimpleDialog(
//                 backgroundColor: Colors.white,
//                 title: Text(
//                   "Hy-Diabemate",
                   
//                   style: TextStyle(
//                     letterSpacing: 1.0,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 26.0,
//                     fontFamily: "courier new",

//                   ),
//                 ),
//                 //                        About 
//                 children: [  
//                   Column(
//                     children: [
//                       Card(
//                         color: Colors.blueAccent,
//                         shadowColor:Colors.grey,
//                         borderOnForeground: true,
//                         child:ListTile(
//                           trailing:IconButton(
//                             onPressed: ()=> Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder:(context)=> First_Page(),
//                               ),
//                             ),
//                             icon: Icon(Icons.apps_rounded),
//                           ),
//                           title: Text(
//                             "About App",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0,
//                               fontFamily: "courier new,"
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             icon: Icon(
//               Icons.contacts,
//               color: Colors.black,
//               size: 35.0,
//             ),
//           ),
//         ),
//         title: Center(
//           child: Text(
//             "Hy-Diabemate",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontFamily: "Satisfy",
//               fontSize: 30.0,
//             ),
//           ),
//         ),
//       ),

//         //                     BODY 
//       body: Container(
//         color: Colors.white30,
//         child: StreamBuilder<Object>(
//           stream: null,
//           builder: (context, snapshot) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                     //                               RESULT(output)
//                   Text(
//                       // ignore: unnecessary_brace_in_string_interps
//                     "Result: ${result}",
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "courier new",
//                         fontSize:20.0,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Expanded(
//                       child: SafeArea(
//                         child: ListView(
//                           children: [
//                             Card(
//                               color: Colors.white38,
//                               child: TextField(
//                                 keyboardType:
//                                 TextInputType.numberWithOptions(decimal:true ) ,
//                                 onChanged: (pg) => pregnant = pg ,
//                                 style: TextStyle(
//                                   fontFamily: "courier new",
//                                   fontSize:24.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 decoration: InputDecoration(hintText: "Number of time pregnant"),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (gl) => glucose = gl,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "Glucose Concentration" ),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (bp) => bloodpressure = bp,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "Diastolic Blood Pressure(mm Hg)" ),
//                               ),
//                             ),
//                               Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (sk) => skin = sk,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "Tricep skin fold thickness (mm)" ),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (il) => insulin = il,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "2-Hour Serum insulin(mu U/ml)" ),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (ma) => mass = ma,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "Body mass index" ),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (db) => diabetes = db,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:
//                                 InputDecoration(hintText: "Body mass index" ),
//                               ),
//                             ),
//                             Card(
//                               color: Colors.blueGrey,
//                               child: TextField(
//                                 keyboardType: 
//                                 TextInputType.numberWithOptions(decimal: true),
//                                 onChanged: (ag) => age = ag,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "courier new",
//                                   fontSize: 24.0,
//                                 ),
//                                 decoration:InputDecoration(hintText: "Age" ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//             );
//           }
//         ),
//         ),
//       );
//   }
// }