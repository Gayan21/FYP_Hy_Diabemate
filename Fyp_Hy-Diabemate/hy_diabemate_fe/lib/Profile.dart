import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  late String _name;
  late int _age;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    _name = currentUser?.displayName ?? 'Unknown';
    _age = currentUser?.metadata.creationTime?.year ?? DateTime.now().year;
  }

  void _updateProfile() {
    final currentUser = FirebaseAuth.instance.currentUser;
    currentUser?.updateProfile(displayName: _name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(57, 7, 204, 178),
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 74, 102, 95),
         leading: BackButton(
           onPressed: () => Navigator.of(context).pop(),
     color: Colors.white
   ), 
         title: Text(
          "Hy-Diabemate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Satisfy",
            fontSize: 35.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100.0),
            const SizedBox(height: 20.0),
            Text(
              'Email: ${currentUser?.email ?? 'Unknown'}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              initialValue: _name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              initialValue: _age.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) {
                setState(() {
                  _age = int.parse(value);
                });
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Update Profile'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:hy_diabemate_fe/Login_screen.dart';
// // import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(Profile());
// }

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 74, 102, 95),
//          leading: BackButton(
//            onPressed: () => Navigator.of(context).pop(),
//      color: Colors.white
//    ), 
//          title: Text(
//           "Hy-Diabemate",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: "Satisfy",
//             fontSize: 35.0,
//           ),
//         ),
//       ),
//         backgroundColor: Color.fromARGB(57, 7, 204, 178),
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(

//    padding: const EdgeInsets.all(5),
//    child: Column(
//      mainAxisSize: MainAxisSize.min,
     
//      children: [
//        CircleAvatar(
//         radius: 50.0,
//                 backgroundImage: AssetImage('lib/assets/images/profile.png'),
//        ),
//        SizedBox(height: 10),
//        Container(
//         //  width: 100,
//          child: Text(
//                 'Crépin Fadjo',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontFamily: 'Pacifico',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black
//                 ),
//               ),
//        )
//     ]
//   )
// ),
//               // CircleAvatar(
//               //   radius: 50.0,
//               //   backgroundImage: AssetImage('lib/assets/images/profile.png'),
//               // ),
//               // Text(
//               //   'Crépin Fadjo',
//               //   style: TextStyle(
//               //     fontSize: 30.0,
//               //     fontFamily: 'Pacifico',
//               //     fontWeight: FontWeight.bold,
//               //     color: Colors.black
//               //   ),
//               // ),
//               // 
//               SizedBox(
//                 height: 20.0,
//                 width: 400,
//                 child: Divider(
                  
//                   height: 20,
//             thickness: 2,
//             indent: 20,
//             endIndent: 20,
//            color: Colors.teal.shade100,
                  
//                 ),
//               ),
//               InkWell(
//                 child: Card(
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.phone,
//                       color: Colors.teal,
//                     ),
//                     title: Text(
//                       '+229 96119149',
//                       style: TextStyle(
//                           fontFamily: 'SourceSansPro',
//                           fontSize: 20,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),

//                 ),
//                 // onTap: (){
//                 //   _launchURL('tel:+229 96119149');
//                 // }
//               ),
//               InkWell(
//                 child: Card(
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.email,
//                       color: Colors.teal,
//                     ),
//                     title:Text(
//                       'fadcrepin@gmail.com',
//                       style: TextStyle(
//                           fontFamily: 'SourceSansPro',
//                           fontSize: 20,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//                 ),
//                 // onTap: (){
//                 //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
//                 // },
//               ),
//               InkWell(
//                 child: Card(
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.timeline,
//                       color: Colors.teal,
//                     ),
//                     title:Text(
//                       '50',
//                       style: TextStyle(
//                           fontFamily: 'SourceSansPro',
//                           fontSize: 20,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//                 ),
//                 // onTap: (){
//                 //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
//                 // },
//               ),
//                  Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.greenAccent, borderRadius: BorderRadius.circular(20)),
//               // ignore: deprecated_member_use
//               child: TextButton(
//                 onPressed: () {
                   
//       //           Navigator.of(context).push(
//       // MaterialPageRoute(builder: (context) =>  Prediction_page())
     
//       //          );
              
             
//                 },
//                 child: Text(
//                   'Edit Details',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
                  
//                 ),
//               ),
//             ),
//             SizedBox(
//       height: 50, // <-- SEE HERE
//     ),
//             Container(
//               padding: EdgeInsets.all(10),
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.greenAccent, borderRadius: BorderRadius.circular(20)),
//               // ignore: deprecated_member_use
//               child: TextButton(
//                 onPressed: () {
                   
//                 Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) =>  LoginScreen())
     
//                );
              
             
//                 },
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
                  
//                 ),
//               ),
//             ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




