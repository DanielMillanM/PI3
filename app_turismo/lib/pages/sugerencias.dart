// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class Sugerencias extends StatefulWidget {
  const Sugerencias({Key? key});

  @override
  State<Sugerencias> createState() => _MySugerenciasState();
}

class _MySugerenciasState extends State<Sugerencias> {
  TextEditingController _errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deja tus sugerencias"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _errorController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("Deja tus sugerencias de mejoras para la app", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String sugerencias = _errorController.text;
                  print('Sugerencias enviadas: $sugerencias');
                  // Agregar aqui  el envio a otro lado
                  
                  _errorController.clear();
                  setState(() {}); // Actualizar el estado 
                },
                child: Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}