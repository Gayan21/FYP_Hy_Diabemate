import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dummy extends StatefulWidget {
  @override
  _DiabetesPredictorState createState() => _DiabetesPredictorState();
}

class _DiabetesPredictorState extends State<dummy> {
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
      Uri.parse('http://127.0.0.1:5000/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
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

    final result = jsonDecode(response.body);

    setState(() {
      _prediction = result['prediction'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Predictor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
          onPressed: _predict,
          child: Text('Predict'),
        ),
        SizedBox(height: 32),
        Text(
          'Prediction: $_prediction',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ),
);
  }
}
           
