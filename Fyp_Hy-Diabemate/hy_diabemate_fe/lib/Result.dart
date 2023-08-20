import 'package:flutter/material.dart';
import 'package:hy_diabemate_fe/Profile.dart';

class Result extends StatelessWidget {
  final String prediction;

  Result({required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 155, 188, 176),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 74, 102, 95),
        centerTitle: true,
        title: Text(
          "Hy-Diabemate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Satisfy",
            fontSize: 35.0,
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
                          // color: Colors.blueAccent,
                          // shadowColor:Colors.grey,
                          borderOnForeground: true,
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(prediction:prediction),
                                ),
                              ),
                              icon: Icon(Icons.apps_rounded),
                            ),
                            title: Text(
                              "Go to Profile ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "courier new,"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // flex: 2,
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Hy-DiabMate \n Empowering You to Take Control of Your Health.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Castoro Titling",
                      fontSize: 16.0,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            
              // flex: 1,
               Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(16.0),
                 
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/type1.png"),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear),
                  ),
                ),
              ),
            
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              // flex: 2,
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    text: "Your prediction: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Castoro Titling",
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    children: [
                      // TextSpan(
                      //   text:
                      //       "${this.prediction == '1' ? 'Positive' : 'Negative'}",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: "Castoro Titling",
                      //     fontSize: 20.0,
                      //     color: this.prediction == '1'
                      //         ? Colors.red
                      //         : Color.fromARGB(255, 2, 104, 6),
                      //   ),
                      // ),
                      TextSpan(
                        text:
                            "${this.prediction == '1' ? 'You might have Type 1 diabetes. Please consult with a Doctor.' : this.prediction == '2' ? 'You might have diabtese. Please consult with a Doctor.' : 'Hurray! You do not have Diabeties.'}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Castoro Titling",
                          fontSize: 20.0,
                          color: this.prediction == '1'
                              ? Colors.red
                              : this.prediction == '2'
                                  ? Colors.yellow
                                  : Color.fromARGB(255, 2, 104, 6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
