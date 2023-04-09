



// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hy_diabemate_fe/Models/user_details.dart';
// // import 'HomePage.dart';
// import 'Prediction_page.dart';

// void main() {
//   runApp(MyApp());
// }

// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Login(),
//     );
//   }
// }

// class Login extends StatefulWidget {
//  Login() :super();




//   @override
//   _Login_Demo_State createState() => _Login_Demo_State();
// }

// class _Login_Demo_State extends State<Login> {
//   TextEditingController userName = TextEditingController();
//   TextEditingController userPwd = TextEditingController();
//  bool isEditing =false;
//  bool  textFieldVisibility =false;

//  String firestoreCollectionName = "Users";

// // late  AuthService authService;

//  getAllUsers(){
//   return FirebaseFirestore.instance.collection(firestoreCollectionName).snapshots();
//  }

//  addUser() async {
//   // AuthService authService = AuthService(userName: userName.text, userPwd : userPwd.text);

// try{
//   FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
//     await FirebaseFirestore.instance
//     .collection(firestoreCollectionName)
//     .doc()
//     .set(authService.toJson());
//   });

// }
// catch(e)
// {
// print(e.toString());
// }

//  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Login Page"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 // ignore: sized_box_for_whitespace
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Image.asset('lib/assets/images/diabetes.png')),
//               ),
//             ),
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.only(top: 10,right: 15,left: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: 'Enter valid email id as abc@gmail.com'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(

//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
//             // ignore: deprecated_member_use
//             TextButton(
//               onPressed: (){
                
//               },
//               child: Text(
//                 'Forgot Password?',
//                 style: TextStyle(color: Colors.black, fontSize: 15),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.greenAccent, borderRadius: BorderRadius.circular(20)),
//               // ignore: deprecated_member_use
//               child: TextButton(
//                 onPressed: () {
//                   //  addUser();
//                 Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) =>  Prediction_page())
     
//                );
              
             
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
                  
//                 ),
//               ),
//             ),
//             // ignore: prefer_const_constructors
//             SizedBox(
//               height: 130,
//             ),
//             Text('New User? Create Account')
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/Models/auth_service.dart';
import 'package:hy_diabemate_fe/Prediction_page.dart';
import 'package:hy_diabemate_fe/create_acount.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/assets/images/diabetes.png')),
                     const SizedBox(
              height: 30.0,
            ),
           
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email',
                border: OutlineInputBorder()),
                  
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                   border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
    primary: Colors.greenAccent, // Background color
  ),
              onPressed: () async {
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  Prediction_page(),
                    ),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
    primary: Colors.greenAccent, // Text Color
  ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}