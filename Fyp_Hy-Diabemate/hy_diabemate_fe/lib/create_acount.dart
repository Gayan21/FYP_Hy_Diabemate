import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/Prediction_page.dart';

import 'Models/auth_service.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        centerTitle: true,
         backgroundColor: Color.fromARGB(255, 74, 102, 95),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( 
              child:Text("Create Account",
               style: TextStyle(color: Color.fromARGB(255, 241, 231, 231),fontSize: 40),
               )),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration:  InputDecoration(hintText: 'Email',
                hintStyle: TextStyle(fontSize: 20.0, color: Color.fromARGB(225, 179, 181, 185)),
                enabledBorder: OutlineInputBorder(
                   borderSide:
          BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
      borderRadius: BorderRadius.circular(50.0),
                ),
                ),
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
                decoration:  InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 20.0, color: Color.fromARGB(225, 179, 181, 185)),
                  enabledBorder: OutlineInputBorder(
                     borderSide:
          BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
      borderRadius: BorderRadius.circular(50.0),
                  )
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
                final message = await AuthService().registration(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  Prediction_page()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
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