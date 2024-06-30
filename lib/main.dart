import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/gender_prediction_screen.dart';
import 'screens/age_prediction_screen.dart';
import 'screens/university_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/wordpress_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(MyToolboxApp());
}

class MyToolboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caja de Herramientas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/gender': (context) => GenderPredictionScreen(),
        '/age': (context) => AgePredictionScreen(),
        '/university': (context) => UniversityScreen(),
        '/weather': (context) => WeatherScreen(),
        '/wordpress': (context) => WordPressNewsScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
