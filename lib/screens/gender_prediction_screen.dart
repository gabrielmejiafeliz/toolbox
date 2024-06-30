import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPredictionScreen extends StatefulWidget {
  @override
  _GenderPredictionScreenState createState() => _GenderPredictionScreenState();
}

class _GenderPredictionScreenState extends State<GenderPredictionScreen> {
  final TextEditingController _controller = TextEditingController();
  String _gender = '';
  String _name = '';
  bool _isLoading = false;

  void _predictGender() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.genderize.io/?name=${_controller.text}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _gender = data['gender'];
        _name = data['name'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Género'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Ingrese su nombre',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predictGender,
                child: Text('Predecir Género'),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : _gender.isNotEmpty
                      ? Column(
                          children: [
                            Text(
                              'Nombre: $_name',
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              'Género: $_gender',
                              style: TextStyle(
                                fontSize: 24,
                                color: _gender == 'male' ? Colors.blue : Colors.pink,
                              ),
                            ),
                          ],
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
