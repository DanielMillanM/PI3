// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_turismo/components/text_field.dart';
import 'package:http/http.dart' as http;
import 'package:app_turismo/pages/terminos_y_condiciones.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  // controladores para el texto de inicio de sesion
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isChecked = false;

  static Future<String> register(String nameController, String mailController, String passwordController, String confirmPasswordController) async {
    
    if (passwordController != confirmPasswordController) {
      print('Las contraseñas no coinciden');
      return 'Las contraseñas no coinciden';
    } else {
      final Map<String, dynamic> requestBody = {
        "name": nameController,
        "email": mailController,
        "password": passwordController,
      };
      
      final response = await http.post(
        Uri.parse('http://192.168.20.20:8000/usuario/register/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        print(data);
        return data['message'];
      }else{
        return 'Error al registrar usuario';
      }
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
                    const Text("Registrarse", style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(width: 70),
                  ]
                ),

                const Divider(thickness: 1, color: Colors.white),
                const SizedBox(height: 40),

                // formulario de registro de usuario
                const Text("Ingresa tu nombre de usuario", style: TextStyle(color: Colors.white, fontSize: 20)),

                Form(
                  child: Column(
                    children: [
                        MyTextField(
                          controller: nameController,
                          hintText: "Nombre",
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),
                        const Text("Ingresa tu correo", style: TextStyle(color: Colors.white, fontSize: 20)),

                        MyTextField(
                          controller: mailController,
                          hintText: "Correo",
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),
                        const Text("Ingresa tu contraseña", style: TextStyle(color: Colors.white, fontSize: 20)),

                        MyTextField(
                          controller: passwordController,
                          hintText: "Contraseña",
                          obscureText: true,
                        ),

                        const SizedBox(height: 20),
                        const Text("Confirma tu contraseña", style: TextStyle(color: Colors.white, fontSize: 20)),

                        MyTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirmar contraseña",
                          obscureText: true,
                        ),

                        const SizedBox(height: 20),

                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked, 
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isChecked = newValue!;
                                    });
                                  },
                                ),
                                Text("Acepto los ", style: TextStyle(color: Colors.white, fontSize: 14)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => MyTerminosYCondiciones()
                                      )
                                    );
                                  },
                                  child: Text(
                                    "Términos y Condiciones",
                                    style: TextStyle(color: Colors.blue, fontSize: 14,),
                                  )
                                ),
                              ]
                            ),
                            
                            MaterialButton(
                              onPressed: isChecked ? () {
                                register(
                                  nameController.text, 
                                  mailController.text, 
                                  passwordController.text, 
                                  confirmPasswordController.text
                                );
                              } : null, // disable button if checkbox is not checked

                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text("Registrarse"),
                            )
                          ]
                        ),
                      ]
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