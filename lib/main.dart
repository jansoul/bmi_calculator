import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: Color(0xFF0A0E21), secondary: Colors.purple.shade700),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(
              bodyMedium: TextStyle(
            color: Colors.white,
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        'recalc': (context) => ResultsPage()
      },
    );
  }
}
