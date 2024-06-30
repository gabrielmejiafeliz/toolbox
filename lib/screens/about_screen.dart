import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('profile.jpeg'), // Añade tu foto en assets
              ),
              SizedBox(height: 20),
              Text(
                'Gabriel Mejia Feliz',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                'Desarrollador de Software',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Contacto:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Correo: gabomejia32@gmail.com',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Teléfono: 829-448-8875',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
