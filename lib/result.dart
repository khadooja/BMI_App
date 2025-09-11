import 'package:bmi_app/core/theme/stylefont.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int age;
  final double bmi;
  final bool isMale;
  const Result(
      {super.key, required this.age, required this.bmi, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}\nAge: $age\nBMI: ${bmi.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: FonttStyle.textAlign,
            ),
            Text(
              'Age Group: ${age < 18 ? 'Under 18' : (age >= 18 && age < 65) ? '18-64' : '65 and over'}',
              textAlign: FonttStyle.textAlign,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'BMI Category: ${bmi < 18.5 ? 'Underweight' : (bmi >= 18.5 && bmi < 24.9) ? 'Normal weight' : (bmi >= 25 && bmi < 29.9) ? 'Overweight' : 'Obesity'}',
              textAlign: FonttStyle.textAlign,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
