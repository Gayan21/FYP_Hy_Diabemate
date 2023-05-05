import 'package:flutter/material.dart';

class SymptomsDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms Description'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Symptoms of Diabetes Mellitus',
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Polyuria',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Increased urination frequency, volume, and/or nocturia (waking up at night to urinate).'),
              SizedBox(height: 16.0),
              Text('Polydipsia',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Excessive thirst, which can be caused by the body\'s effort to compensate for dehydration due to increased urination.'),
              SizedBox(height: 16.0),
              Text('Weight loss',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Unexplained weight loss despite a normal or increased appetite.'),
              SizedBox(height: 16.0),
              Text('Weakness',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Generalized feeling of tiredness, fatigue, or lack of energy.'),
              SizedBox(height: 16.0),
              Text('Polyphagia',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Increased hunger or appetite, which can also be caused by the body\'s effort to compensate for energy loss due to diabetes.'),
              SizedBox(height: 16.0),
              Text('Genital thrush',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Yeast infection of the genitals or other moist areas of the body.'),
              SizedBox(height: 16.0),
              Text('Visual blurring',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Blurry or distorted vision, often due to high blood sugar levels affecting the eyes.'),
              SizedBox(height: 16.0),
              Text('Itching',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Dry, itchy skin, especially in the genital or groin area.'),
              SizedBox(height: 16.0),
              Text('Irritability',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Mood swings or changes in behavior, which can be caused by fluctuations in blood sugar levels.'),
              SizedBox(height: 16.0),
              Text('Delayed healing',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Slow healing of cuts, wounds, or infections.'),
              SizedBox(height: 16.0),
              Text('Partial paresis',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text(
                  'Weakness or paralysis of a part of the body, often affecting the limbs or face.'),
              SizedBox(height: 16.0),
              Text('Muscle stiffness',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Stiff or achy muscles, especially in the morning.'),
              SizedBox(height: 16.0),
              Text('Alopecia',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Hair loss or thinning, often on the scalp.'),
            ],
          ),
        ),
      ),
    );
  }
}
