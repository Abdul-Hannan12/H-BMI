import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _height = 100.0;
  double _weight = 40.0;
  double _bmi = 0.0;
  late BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 199, 234, 250),
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child:
                  Image.asset("assets/images/heart.png", fit: BoxFit.contain)),
          const SizedBox(height: 16),
          const Text(
            "BMI CALCULATOR",
            style: TextStyle(
                color: Colors.red, fontSize: 32, fontWeight: FontWeight.w700),
          ),
          const Text('we care about your health'),
          const SizedBox(
            height: 40,
          ),
          const Text("Height (cm)",
              style: TextStyle(
                  color: Color.fromARGB(255, 72, 72, 72),
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 12,
          ),
          Slider(
            min: 80.0,
            max: 250.0,
            value: double.parse(_height.toStringAsFixed(2)),
            divisions: 100,
            activeColor: Colors.pink,
            label: "${double.parse(_height.toStringAsFixed(2))}",
            onChanged: (height) {
              setState(() {
                _height = height;
              });
            },
          ),
          Text("${double.parse(_height.toStringAsFixed(2))} cm",
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 40,
          ),
          const Text("Weight (kg)",
              style: TextStyle(
                  color: Color.fromARGB(255, 72, 72, 72),
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 12,
          ),
          Slider(
            min: 30.0,
            max: 120.0,
            value: double.parse(_weight.toStringAsFixed(2)),
            divisions: 100,
            activeColor: Colors.pink,
            label: "${double.parse(_weight.toStringAsFixed(2))}",
            onChanged: (weight) {
              setState(() {
                _weight = weight;
              });
            },
          ),
          Text("${double.parse(_weight.toStringAsFixed(2))} kg",
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton.icon(
              onPressed: () {
                _bmi = _weight / ((_height / 100) * (_height / 100));
                if (_bmi >= 18.5 && _bmi <= 25) {
                  _bmiModel = BMIModel(_bmi, true, "You are fit");
                } else if (_bmi < 18.5) {
                  _bmiModel = BMIModel(_bmi, false, "You are underweighted");
                } else if (_bmi > 25 && _bmi <= 30) {
                  _bmiModel = BMIModel(_bmi, false, "You are overweighted");
                } else {
                  _bmiModel = BMIModel(_bmi, false, "You are obesed");
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(_bmiModel)));
              },
              icon: const Icon(Icons.favorite, color: Colors.white),
              label: const Text("CALCULATE"),
              textColor: Colors.white,
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}
