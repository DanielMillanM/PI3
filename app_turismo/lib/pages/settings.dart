// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Configuración", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person, size: 40,),
                title: Text("Configuración de perfil"),
                onTap: () {
                    Navigator.pushNamed(context, "/userconfig");
                },
              ),
              ListTile(
                leading: Icon(Icons.mail, size: 40,),
                title: Text("Buzón"),
                subtitle: Text("Reportar errores"),
                onTap: () {
                    Navigator.pushNamed(context, "/buzon");
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback, size: 40,),
                title: Text("Quejas y sugerencias"),
                onTap: () {
                    Navigator.pushNamed(context, "/sugerencias");
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}