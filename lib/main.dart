import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey[700],
          accentColor: Colors.teal[600],
          scaffoldBackgroundColor: Colors.blueGrey[300],
          textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFF0A0E21)))),
      home: InputPage(),
    );
  }
}
