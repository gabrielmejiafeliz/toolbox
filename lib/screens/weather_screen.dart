import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _weather = '';
  bool _isLoading = false;

  void _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo&appid=a771849125ac3c5740856f9c6958bb1b&units=metric'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _weather = 'Temperature: ${data['main']['temp']}°C\nDescription: ${data['weather'][0]['description']}';
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _weather = 'Failed to load weather data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima en RD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
              ? CircularProgressIndicator()
              : Text(
                  _weather,
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ),
    );
  }
}
