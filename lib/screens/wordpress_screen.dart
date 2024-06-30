import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class WordPressNewsScreen extends StatefulWidget {
  @override
  _WordPressNewsScreenState createState() => _WordPressNewsScreenState();
}

class _WordPressNewsScreenState extends State<WordPressNewsScreen> {
  List _posts = [];
  bool _isLoading = false;

  void _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://www.amcnetworks.com/wp-json/wp/v2/posts'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _posts = data;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de WordPress'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200, // Ajusta la altura según sea necesario
                      child: Image.asset('AMC.png'),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _posts.length >= 3 ? 3 : _posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_posts[index]['title']['rendered']),
                            subtitle: Text(_posts[index]['excerpt']['rendered']),
                            trailing: IconButton(
                              icon: Icon(Icons.open_in_browser),
                              onPressed: () async {
                                final url = _posts[index]['link'];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
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

