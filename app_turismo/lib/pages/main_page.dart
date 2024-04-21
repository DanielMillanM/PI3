// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app_turismo/pages/login_page.dart';
import 'package:app_turismo/pages/register_page.dart';


class MyMainPage extends StatelessWidget {
  const MyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 58, 85),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // texto de bienvenida
              const SizedBox(height: 20),
              const Text("Bienvenido a BucaraTismo", style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 20),
              
              // divisor
              const Divider(thickness: 1, color: Colors.white),
              const SizedBox(height: 100),
              
              // botones de inicio
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()));
                    }, 
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  const Text("Iniciar Sesión", style: TextStyle(color: Colors.white, fontSize: 20)),
                ]
              ),

              const SizedBox(height: 150),

              // boton de registro
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegisterPage()));
                    }, 
                    icon: const Icon(
                      Icons.person_add_alt_1,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  const Text("Registrame", style: TextStyle(color: Colors.white, fontSize: 20)),
                ]
              )

            ]
          )
        )
      ),
    );
  }
}