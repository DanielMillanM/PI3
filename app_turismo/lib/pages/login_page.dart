// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_turismo/components/text_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatelessWidget {
  MyLoginPage({super.key});

  // controladores para el texto de inicio de sesion
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  static Future<String> login(BuildContext context, mailController, String passwordController) async {
    
    final Map<String, dynamic> requestBody = {
      "email": mailController,
      "password": passwordController,
    };
    
    final response = await http.post(
      Uri.parse('https://psychic-halibut-qxgqvqgqxx5244pw-8000.app.github.dev/usuario/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['access'];
      
      print(token);
      // guarda el token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      if (token != null) {
        Navigator.pushNamed(context, "/bodyBuild");
      }
      return data['access'];
    }else{
      return 'Error al iniciar sesion';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 58, 85),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Text("Inicia Sesion", style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(width: 60),
                  ]
                ),

                const Divider(thickness: 1, color: Colors.white),
                const SizedBox(height: 40),
                

                // formulario de inicio de sesion
                const Text("Ingresa tu correo", style: TextStyle(color: Colors.white, fontSize: 20)),

                MyTextField(
                  controller: mailController,
                  hintText: "Correo",
                  obscureText: false,
                ),

                const SizedBox(height: 40),
                const Text("Ingresa la contraseña", style: TextStyle(color: Colors.white, fontSize: 20)),

                MyTextField(
                  controller: passwordController,
                  hintText: "Contraseña",
                  obscureText: true,
                ),

                const SizedBox(height: 40),

                IconButton(
                  onPressed: () {
                    login(
                      context,
                      mailController.text, 
                      passwordController.text,
                    );
                  }, 
                  icon: const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 50,
                    color: Colors.white,
                  )
                ),
              ]
            )
          )
        )
      ),
    );
  }
}