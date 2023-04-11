# import numpy as np
# import pandas as pd
# from flask_cors import cross_origin
# from flask import Flask, request, render_template
# import pickle
#
# app = Flask(__name__)
#
#
# @cross_origin()
# @app.route('/')
# def home():
#     return render_template('index.html')
#
#
# @cross_origin()
# @app.route('/predict', methods=['POST'])
# def predict():
#     Pregnancies = float(request.form['Pregnancies'])
#     Glucose = float(request.form['Glucose'])
#     BloodPressure = float(request.form['BloodPressure'])
#     SkinThickness = float(request.form['SkinThickness'])
#     Insulin = float(request.form['Insulin'])
#     BMI = float(request.form['BMI'])
#     DiabetesPedigreeFunction = float(request.form['DiabetesPedigreeFunction'])
#     Age = float(request.form['Age'])
#
#     filename = 'modelForPrediction.sav'
#     loaded_model = pickle.load(open(filename, 'rb'))  # loading the model file from the storage
#     scalar = pickle.load(open("sandardScalar.sav", 'rb'))
#     # predictions using the loaded model file
#     prediction = loaded_model.predict(scalar.transform(
#         [[Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age]]))
#     if prediction == [1]:
#         prediction = "diabetes"
#
#     else:
#         prediction = "Normal"
#
#     # showing the prediction results in a UI
#     if prediction == "diabetes":
#
#         return render_template('diabetes.html', prediction=prediction)
#     else:
#         return render_template('Normal.html', prediction=prediction)
#
#
# if __name__ == "__main__":
#     app.run(host='0.0.0.0', port=8000, debug=True)
# # app.run(debug=True)


from flask import Flask, render_template, request, redirect, jsonify
import numpy as np

import pickle

with open('ml_model.pkl', 'rb') as file:
    classifier = pickle.load(file)

app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('home.html', home_active='active')


@app.route('/predict', methods=['GET', 'POST'])
def predict():
    if request.method == 'POST':
        num_preg = request.form.get('Pregnancies')
        glucose_conc = request.form.get('Glucose')
        diastolic_bp = request.form.get('BloodPressure')
        thickness = request.form.get('SkinThickness')
        insulin = request.form.get('InsulinLevel')
        bmi = request.form.get('BodyMassIndex')
        dpf = request.form.get('DiabetesPedigreeFunction')
        age = request.form.get('Age')

        data = np.array([[int(num_preg), int(glucose_conc), int(diastolic_bp), int(thickness), int(insulin), float(bmi),
                          float(dpf), int(age)]])
        prediction = classifier.predict(data)

        context = {
            'num_preg': num_preg,
            'glucose_conc': glucose_conc,
            'diastolic_bp': diastolic_bp,
            'thickness': thickness,
            'insulin': insulin,
            'bmi': bmi,
            'dpf': dpf,
            'age': age,
            'pred': prediction
        }

        return render_template('prediction.html', context=context, pred_active='active')

    elif request.method == 'GET':
        return redirect('/')


@app.route('/api')
def api_help():
    return render_template('api.html', api_active='active')


@app.route(
    '/api/<int:num_preg>/<int:glucose_conc>/<int:diastolic_bp>/<int:thickness>/<int:insulin>/<float:bmi>/<float:dpf>/<int:age>')
def api_pred(num_preg, glucose_conc, diastolic_bp, thickness, insulin, bmi, dpf, age):
    data = np.array([[int(num_preg), int(glucose_conc), int(diastolic_bp), int(thickness), int(insulin), float(bmi),
                      float(dpf), int(age)]])
    prediction = classifier.predict(data)

    result = {
        'num_preg': num_preg,
        'glucose_conc': glucose_conc,
        'diastolic_bp': diastolic_bp,
        'thickness': thickness,
        'insulin': insulin,
        'bmi': bmi,
        'dpf': dpf,
        'age': age,
        'pred': bool(prediction[0])
    }

    return jsonify(result)


if __name__ == '__main__':
    app.run(debug=True)
