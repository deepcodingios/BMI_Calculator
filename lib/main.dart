import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      ),
      home: InputPage(),
    );
  }
}
