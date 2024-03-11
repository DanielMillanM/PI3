import 'package:flutter/material.dart';

class MyTerminosYCondiciones extends StatelessWidget {
  MyTerminosYCondiciones({super.key});

  // controladores para el texto de inicio de sesion
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 58, 85),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // texto de bienvenida
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Text("Terminos y Condiciones", style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(width: 60),
                ]
              ),

              const Divider(thickness: 1, color: Colors.white),
              const SizedBox(height: 40),
              
            ]
          )
        )
      ),
    );
  }
}