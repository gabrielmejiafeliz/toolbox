import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Opciones de la Caja'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Predicción de Género'),
            onTap: () {
              Navigator.pushNamed(context, '/gender');
            },
          ),
          ListTile(
            title: Text('Predicción de Edad'),
            onTap: () {
              Navigator.pushNamed(context, '/age');
            },
          ),
          ListTile(
            title: Text('Universidades'),
            onTap: () {
              Navigator.pushNamed(context, '/university');
            },
          ),
          ListTile(
            title: Text('Clima en RD'),
            onTap: () {
              Navigator.pushNamed(context, '/weather');
            },
          ),
          ListTile(
            title: Text('Noticias de WordPress'),
            onTap: () {
              Navigator.pushNamed(context, '/wordpress');
            },
          ),
          ListTile(
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
