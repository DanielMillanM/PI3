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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String error = _errorController.text;
                  print('Error reportado: $error');
                  // Aquí puedes realizar cualquier acción adicional, como enviar el formulario a un servidor.
                  // Por ahora, solo imprimimos el error en la consola.
                  
                  // Limpiar el campo de texto y refrescar el formulario
                  _errorController.clear();
                  setState(() {}); // Actualizar el estado para refrescar el formulario
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