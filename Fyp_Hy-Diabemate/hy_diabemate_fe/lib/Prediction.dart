import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hy_diabemate_fe/Result.dart';
import 'package:hy_diabemate_fe/Profile.dart';
import 'package:hy_diabemate_fe/symptoms_page.dart';

class Prediction extends StatefulWidget {
  @override
  _DiabetesPredictorState createState() => _DiabetesPredictorState();
}

class _DiabetesPredictorState extends State<Prediction> {
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final polyuriaController = TextEditingController();
  final polydipsiaController = TextEditingController();
  final weightController = TextEditingController();
  final weaknessController = TextEditingController();
  final polyphagiaController = TextEditingController();
  final genitalThrushController = TextEditingController();
  final visualBlurringController = TextEditingController();
  final itchingController = TextEditingController();
  final irritabilityController = TextEditingController();
  final delayedHealingController = TextEditingController();
  final partialParesisController = TextEditingController();
  final muscleStiffnessController = TextEditingController();
  final alopeciaController = TextEditingController();
  final obesityController = TextEditingController();

  String _prediction = '';

  Future<void> _predict() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'), //http://127.0.0.1:5000/predict
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'age': ageController.text,
        'gender': genderController.text,
        'polyuria': polyuriaController.text,
        'polydipsia': polydipsiaController.text,
        'weight': weightController.text,
        'weakness': weaknessController.text,
        'polyphagia': polyphagiaController.text,
        'genital_thrush': genitalThrushController.text,
        'visual_blurring': visualBlurringController.text,
        'itching': itchingController.text,
        'irritability': irritabilityController.text,
        'delayed_healing': delayedHealingController.text,
        'partial_paresis': partialParesisController.text,
        'muscle_stiffness': muscleStiffnessController.text,
        'alopecia': alopeciaController.text,
        'obesity': obesityController.text,
      }),
    );
    print(response.body);
    final result = jsonDecode(response.body);
    // print(result);

    setState(() {
      _prediction = result['prediction'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 74, 102, 95),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Hy-Diabemate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Satisfy",
              fontSize: 30.0,
            ),
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
                                        builder: (context) =>
                                            SymptomsDescriptionPage(),
                                      ),
                                    ),
                                    icon: Icon(Icons.apps_rounded),
                                  ),
                                  title: Text(
                                    "Click here",
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
                icon: Tooltip(
                  message: "Click me for more information",
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.white,
                    size: 35.0,
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(61, 64, 165, 131),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  child: Text(
                "Please provide your details",
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 8, 8),
                  fontSize: 20,
                  fontFamily: "Castoro Titling",
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender (Male/Female)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: polyuriaController,
                  decoration: InputDecoration(
                    labelText: 'Polyuria (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: polydipsiaController,
                  decoration: InputDecoration(
                    labelText: 'Polydipsia (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: 'Weight Loss (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: weaknessController,
                  decoration: InputDecoration(
                    labelText: 'Weakness (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: polyphagiaController,
                  decoration: InputDecoration(
                    labelText: 'Polyphagia (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: genitalThrushController,
                  decoration: InputDecoration(
                    labelText: 'Genital Thrush (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: visualBlurringController,
                  decoration: InputDecoration(
                    labelText: 'Visual Blurring (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: itchingController,
                  decoration: InputDecoration(
                    labelText: 'Itching (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: irritabilityController,
                  decoration: InputDecoration(
                    labelText: 'Irritability (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: delayedHealingController,
                  decoration: InputDecoration(
                    labelText: 'Delayed Healing (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: partialParesisController,
                  decoration: InputDecoration(
                    labelText: 'Partial Paresis (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: muscleStiffnessController,
                  decoration: InputDecoration(
                    labelText: 'Muscle Stiffness (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: alopeciaController,
                  decoration: InputDecoration(
                    labelText: 'Alopecia (Yes/No)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: obesityController,
                  decoration: InputDecoration(
                    labelText: 'Obesity (Yes/No)',
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                //         onPressed: _predict,
                onPressed: () async {
                  // final prediction = await _predict();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              prediction: _prediction,
                            )),
                  );
                },
                child: Text('Predict'),
              ),
              SizedBox(height: 32),
              // Text(
              //   'Prediction: $_prediction',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
