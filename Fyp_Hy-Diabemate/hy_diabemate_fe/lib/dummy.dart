import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dummy extends StatefulWidget {
  @override
  _DiabetesPredictionState createState() => _DiabetesPredictionState();
}

class _DiabetesPredictionState extends State<dummy> {
  bool gender = false;
  bool polyuria = false;
  bool polydipsia = false;
  bool weightLoss = false;
  bool weakness = false;
  bool polyphagia = false;
  bool genitalThrush = false;
  bool visualBlurring = false;
  bool itching = false;
  bool irritability = false;
  bool delayedHealing = false;
  bool partialParesis = false;
  bool muscleStiffness = false;
  bool alopecia = false;
  bool obesity = false;
  bool result = false;

  Future<void> predictDiabetes() async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/predict'),
      body: {
        'Gender': gender ? 'Male' : 'Female',
        'Polyuria': polyuria ? 'Yes' : 'No',
        'Polydipsia': polydipsia ? 'Yes' : 'No',
        'sudden_weight_loss': weightLoss ? 'Yes' : 'No',
        'weakness': weakness ? 'Yes' : 'No',
        'Polyphagia': polyphagia ? 'Yes' : 'No',
        'Genital_thrush': genitalThrush ? 'Yes' : 'No',
        'visual_blurring': visualBlurring ? 'Yes' : 'No',
        'Itching': itching ? 'Yes' : 'No',
        'Irritability': irritability ? 'Yes' : 'No',
        'delayed_healing': delayedHealing ? 'Yes' : 'No',
        'partial_paresis': partialParesis ? 'Yes' : 'No',
        'muscle_stiffness': muscleStiffness ? 'Yes' : 'No',
        'Alopecia': alopecia ? 'Yes' : 'No',
        'Obesity': obesity ? 'Yes' : 'No',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        result = jsonResponse['result'];
      });
    } else {
      setState(() {
        result = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Prediction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Gender'),
              value: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Polyuria'),
              value: polyuria,
              onChanged: (value) {
                setState(() {
                  polyuria = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Polydipsia'),
              value: polydipsia,
              onChanged: (value) {
                setState(() {
                  polydipsia = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Sudden Weight Loss'),
              value: weightLoss,
              onChanged: (value) {
                setState(() {
                  weightLoss = value;
                });
              },
            ),
           SwitchListTile(
        title: Text('Weakness'),
        value: weakness,
        onChanged: (value) {
        setState(() {
        weakness = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Polyphagia'),
        value: polyphagia,
        onChanged: (value) {
        setState(() {
        polyphagia = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Genital Thrush'),
        value: genitalThrush,
        onChanged: (value) {
        setState(() {
        genitalThrush = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Visual Blurring'),
        value: visualBlurring,
        onChanged: (value) {
        setState(() {
        visualBlurring = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Itching'),
        value: itching,
        onChanged: (value) {
        setState(() {
        itching = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Irritability'),
        value: irritability,
        onChanged: (value) {
        setState(() {
        irritability = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Delayed Healing'),
        value: delayedHealing,
        onChanged: (value) {
        setState(() {
        delayedHealing = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Partial Paresis'),
        value: partialParesis,
        onChanged: (value) {
        setState(() {
        partialParesis = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Muscle Stiffness'),
        value: muscleStiffness,
        onChanged: (value) {
        setState(() {
        muscleStiffness = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Alopecia'),
        value: alopecia,
        onChanged: (value) {
        setState(() {
        alopecia = value;
        });
        },
        ),
        SwitchListTile(
        title: Text('Obesity'),
        value: obesity,
        onChanged: (value) {
        setState(() {
        obesity = value;
        });
        },
        ),
        ElevatedButton(
        onPressed: predictDiabetes,
        child: Text('Predict'),
        ),
        result != null
        ? Text(
        result ? 'Positive' : 'Negative',
        style: TextStyle(fontSize: 24),
        )
        : Container(),
        ],
        ),
        ),
        );
        }
        }