import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int age;
  final double bmi;
  final bool isMale;
  const Result({super.key, required this.age, required this.bmi, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Body Mass Index'),
      ),
      body: Center(
        child: Text(
          'Gender: ${isMale ? 'Male' : 'Female'}\nAge: $age\nBMI: $bmi',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
