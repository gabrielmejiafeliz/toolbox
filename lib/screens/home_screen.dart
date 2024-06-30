import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de Herramientas'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('caja.png',
              width: 400, // Ajusta el ancho de la imagen
              height: 400, // Ajusta el alto de la imagen
            ),
            SizedBox(height: 20),
            Text('Bienvenido a la Caja de Herramientas Sabelotodo'),
          ],
        ),
      ),
    );
  }
}

