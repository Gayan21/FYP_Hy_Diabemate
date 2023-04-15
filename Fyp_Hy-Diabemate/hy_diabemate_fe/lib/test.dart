import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/first_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_url/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(test());

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenUrlDemo(),
    );
  }
}

class OpenUrlDemo extends StatelessWidget {

  _launchURLBrowser() async {
    const url = 'http://192.168.1.104:8501';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // _launchURLApp() async {
  //   const url = 'https://flutterdevs.com/';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceSafariVC: true, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
          title: Text('Flutter Open Url Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            TextButton(
              style: TextButton.styleFrom(
    primary: Colors.purpleAccent, // Text Color
  ),
              // color: Colors.teal,
              onPressed: _launchURLBrowser,
              child: Text('Press Url Browser',style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 8,),
            // ignore: deprecated_member_use
          //  TextButton(
          //     // color: Colors.teal,
          //     onPressed: _launchURLApp,
          //     // padding: EdgeInsets.only(left: 30,right: 30),
          //     child: Text('Press Url App',style: TextStyle(color: Colors.white),),
          //   ),
          ],
        ),
      ),
      
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';

// class test extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<test> {
//   bool gotvalue = false;
//   var imageUrl;

//   getData() async{
//     http.Response response = await http.get(Uri.parse('http://127.0.0.1:5000/'));
//     return response.body;
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter with Flask"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Supervised Learning demo',
//             ),
//             gotvalue?Container(
//             child:Image.network(
//                 imageUrl)):
//             ElevatedButton(onPressed:() async{
//               var data = await getData();
//               print(data);
//               setState(() {
//                 imageUrl = data;
//                 gotvalue = true;
//               });
//             },
//               child: Text("Predict"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }