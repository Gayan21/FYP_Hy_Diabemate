

// import 'package:flutter/material.dart';
// import 'package:hy_diabemate_fe/Models/auth_service.dart';
// import 'package:hy_diabemate_fe/Prediction_page.dart';
// import 'package:hy_diabemate_fe/create_acount.dart';
// import 'package:hy_diabemate_fe/dummy.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(57, 7, 204, 178),
//       appBar: AppBar(
//         // title: const Text('Login'),
//          title: Text(
//           "Hy-Diabemate",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: "Satisfy",
//             fontSize: 35.0,
//           ),
//         ),
//        backgroundColor: Color.fromARGB(255, 74, 102, 95),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//               Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Image.asset('lib/assets/images/diabetes.png')),
//                      const SizedBox(
//               height: 30.0,
//             ),

//             SizedBox(
//               width: 300,
//               // width: MediaQuery.of(context).size.width / 2,
//               child: TextField(

//                 controller: _emailController,
//                 decoration:  InputDecoration(hintText: 'Email',
//                 hintStyle: TextStyle(fontSize: 20.0, color: Color.fromARGB(225, 179, 181, 185)),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//           BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
//       borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 ),

//               ),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             SizedBox(
//               width: 300,
//               // width: MediaQuery.of(context).size.width / 2,
//               child: TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration:  InputDecoration(
//                   hintText: 'Password',
//                   hintStyle: TextStyle(fontSize: 20.0, color: Color.fromARGB(225, 179, 181, 185)),
//                    enabledBorder: OutlineInputBorder(
//                      borderSide:
//           BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
//       borderRadius: BorderRadius.circular(50.0),
//                    ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//     primary: Colors.greenAccent, // Background color
//   ),
//               onPressed: () async {
//                 final message = await AuthService().login(
//                   email: _emailController.text,
//                   password: _passwordController.text,
//                 );
//                 if (message!.contains('Success')) {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       // builder: (context) =>  Prediction_page(),
//                       builder: (context) => dummy(),
//                     ),
//                   );
//                 }
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(message),
//                   ),
//                 );
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//     primary: Colors.greenAccent, // Text Color
//   ),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const CreateAccount(),
//                   ),
//                 );
//               },
//               child: const Text('Create Account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hy_diabemate_fe/Models/auth_service.dart';
import 'package:hy_diabemate_fe/create_acount.dart';
import 'package:hy_diabemate_fe/dummy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Success!'),
        content: Text('You have successfully logged in.'),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => dummy(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(57, 7, 204, 178),
      appBar: AppBar(
        title: Text(
          "Hy-Diabemate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Satisfy",
            fontSize: 35.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 74, 102, 95),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 150,
                child: Image.asset('lib/assets/images/diabetes.png'),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(225, 179, 181, 185),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(225, 179, 181, 185),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: _isLoading ? CircularProgressIndicator() : Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                        });
                        final String? result = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        setState(() {
                          _isLoading = false;
                        });
                        if (result == 'Success') {
                          _showSuccessDialog();
                        } else {
                          _showErrorDialog(result!);
                        }
                      },
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
      ),
    );
  }
}
