import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final BMIModel _bmiModel;

  const ResultScreen(this._bmiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 199, 234, 250),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: _bmiModel.isNormal
                    ? Image.asset(
                        "assets/images/happy.png",
                        fit: BoxFit.contain,
                      )
                    : Image.asset("assets/images/sad.png",
                        fit: BoxFit.contain)),
            const SizedBox(height: 20),
            Text("Your BMI is ${_bmiModel.bmi.round()}",
                style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 34,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 5),
            Text(_bmiModel.comment,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            _bmiModel.isNormal
                ? const Text("Hurray! Your BMI is normal",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))
                : const Text("Your BMI is not normal",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text("LETS CALCULATE AGAIN"),
                textColor: Colors.white,
                color: Colors.pink,
              ),
            )
          ],
        ),
      ),
    );
  }
}
