import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionScreen extends StatefulWidget {
  @override
  _AgePredictionScreenState createState() => _AgePredictionScreenState();
}

class _AgePredictionScreenState extends State<AgePredictionScreen> {
  final TextEditingController _controller = TextEditingController();
  int _age = 0;
  String _category = '';
  bool _isLoading = false;

  void _predictAge() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.agify.io/?name=${_controller.text}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _age = data['age'];
        if (_age <= 18) {
          _category = 'Joven';
        } else if (_age <= 60) {
          _category = 'Adulto';
        } else {
          _category = 'Anciano';
        }
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
        title: Text('Predicción de Edad'),
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
                onPressed: _predictAge,
                child: Text('Predecir Edad'),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : _age > 0
                      ? Column(
                          children: [
                            Text(
                              'Edad: $_age',
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              'Categoría: $_category',
                              style: TextStyle(
                                fontSize: 24,
                                color: _category == 'Joven'
                                    ? Colors.green
                                    : _category == 'Adulto'
                                        ? Colors.orange
                                        : Colors.grey,
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
