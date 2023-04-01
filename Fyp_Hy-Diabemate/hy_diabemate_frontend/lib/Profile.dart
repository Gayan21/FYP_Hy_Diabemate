import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.greenAccent,
         leading: BackButton(
     color: Colors.white
   ), 
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "courier new",
            fontSize: 35.0,
          ),
        ),
      ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('lib/assets/images/profile.png'),
              ),
              Text(
                'Crépin Fadjo',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Text(
              //   'Flutter Developer'.toUpperCase(),
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     fontFamily: 'SourceSansPro',
              //     color: Colors.teal.shade100,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 2.5,
              //   ),
              // ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+229 96119149',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),

                ),
                // onTap: (){
                //   _launchURL('tel:+229 96119149');
                // }
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title:Text(
                      'fadcrepin@gmail.com',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
                // onTap: (){
                //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
                // },
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.timeline,
                      color: Colors.teal,
                    ),
                    title:Text(
                      '50',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),
                // onTap: (){
                //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
                // },
              ),
                Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('Edit Details', style: TextStyle(fontSize: 20.0),),  
                color: Colors.greenAccent,  
                textColor: Colors.white,  
                onPressed: () {},  
              ),  
            ),  
            Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('Log Out', style: TextStyle(fontSize: 20.0),),  
                color: Colors.greenAccent,  
                textColor: Colors.white,  
                onPressed: () {},  
              ),  
            ),  

            ],
          ),
        ),
      ),
    );
  }
}




