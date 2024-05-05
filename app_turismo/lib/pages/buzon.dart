// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class Buzon extends StatefulWidget {
  const Buzon({Key? key});

  @override
  State<Buzon> createState() => _MyBuzonState();
}

class _MyBuzonState extends State<Buzon> {
  TextEditingController _errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportar Error"),
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
                  labelText: 'Descripción del error',
                  border: OutlineInputBorder(),
                ),
              ),
              Text("te haz encontrado con un error?, no dudes en reportarlo, por favor asegurate de enviar cosas importantes por este medio", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String error = _errorController.text;
                  print('Error reportado: $error');
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