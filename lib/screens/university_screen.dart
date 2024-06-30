import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';


class UniversityScreen extends StatefulWidget {
  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  final TextEditingController _controller = TextEditingController();
  List _universities = [];
  bool _isLoading = false;

  void _fetchUniversities() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=${_controller.text}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _universities = data;
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
        title: Text('Lista de Universidades'),
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
                  labelText: 'Ingrese el nombre del país en inglés',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchUniversities,
                child: Text('Buscar Universidades'),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _universities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_universities[index]['name']),
                            subtitle: Text(_universities[index]['domains'].join(', ')),
                            trailing: IconButton(
                              icon: Icon(Icons.open_in_browser),
                              onPressed: () {
                                launch(_universities[index]['web_pages'][0]);
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
