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
                leading: Icon(Icons.settings, size: 40,),
                title: Text("Opciones"),
                onTap: () {
                  // llamar a la página de detalles del lugar
                },
              ),
              ListTile(
                leading: Icon(Icons.person, size: 40,),
                title: Text("Configuración de perfil"),
                onTap: () {
                  // llamar a la página de detalles del lugar
                },
              ),
              ListTile(
                leading: Icon(Icons.mail, size: 40,),
                title: Text("Buzón"),
                subtitle: Text("Reportar errores"),
                onTap: () {
                  // llamar a la página de detalles del lugar
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback, size: 40,),
                title: Text("Quejas y sugerencias"),
                onTap: () {
                  // llamar a la página de detalles del lugar
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}