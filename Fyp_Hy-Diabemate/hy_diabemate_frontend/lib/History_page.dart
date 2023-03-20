import 'package:flutter/material.dart';  
  
void main() {  
  runApp(History_page(  
    // products: List<String>.generate(500, (i) => "Product List: $i"),  
  ));  
}  
  
class History_page extends StatelessWidget {  
  // final List<String> products;  
  

  // History_page({Key key, @required this.products}) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Hy-diabemate';  
  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        appBar: AppBar(  
          centerTitle: true,
          backgroundColor: Colors.greenAccent,

          title: Text(appTitle,
          style: TextStyle(fontSize: 24,
          fontFamily: "satisfy"),)
         
          
          
          ,  
        ),  
       body: ListView(
          children: const <Widget>[
            ListTile(
              
              title: Text('Map'),
            ),
            ListTile(
              
              title: Text('Album'),
            ),
            ListTile(
              
              title: Text('Phone'),
            ),
          ],
        ),
      ),  
    );  
  }  
}  