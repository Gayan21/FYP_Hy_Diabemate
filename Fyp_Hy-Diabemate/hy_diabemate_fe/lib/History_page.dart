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
          children: [
            SizedBox(
              width: 200.0,
            height: 100.0,
            
            
            ),
            Text("Prediction History",
            style: TextStyle(fontSize: 24) ,
             textAlign: TextAlign.center,),
            Text("All Reports",style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,)
            ,
            ListTile(
              
              title: Text('Map'),
            ),
            
            ListTile(
              
              title: Text('Album'),
            ),
            ListTile(
              
              title: Text('Phone'),
            ),
             Container(
            padding:  EdgeInsets.all(15),  
            child: MaterialButton( 
              height: 40.0, 
              minWidth: 40.0, 
              color: Colors.greenAccent, 
              textColor: Colors.white, 
              child: new Text("View Report"), 
              onPressed: () {
                Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  History_page())
     
               );
              
              }, 
              splashColor: Colors.redAccent,
              )
            
            
          ),
            
         
          ],
          
        ),
        
      ),  
    );  
  }  
}  