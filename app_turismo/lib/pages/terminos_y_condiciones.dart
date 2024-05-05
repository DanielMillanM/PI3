// ignore_for_file: prefer_const_constructors

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado
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
                    const Text(
                      "Términos y Condiciones",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
                const Divider(thickness: 1, color: Colors.white),
                const SizedBox(height: 20),
                // Contenido
                Text(
                  "Términos y Condiciones de Bucaratismo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Última actualización: [22/04/2024]",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Bienvenido a Bucaratismo. Esta aplicación móvil está diseñada para proporcionar información turística sobre los lugares de interés, y proporcionar rutas a estos mismo dentro de la ciudad de Bucaramanga y su área metropolitana. Al acceder y utilizar nuestra aplicación, aceptas cumplir con los siguientes términos y condiciones de uso.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "1. Aceptación de los Términos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Al utilizar la aplicación de áreas turísticas de Bucaramanga, aceptas cumplir con estos términos y condiciones, así como con todas las leyes y regulaciones aplicables. Si no estás de acuerdo con alguno de estos términos, te recomendamos que no utilices nuestra aplicación.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "2. Uso de la Aplicación",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "2.1. La aplicación de áreas turísticas de Bucaramanga es solo para uso personal y no comercial. No puedes utilizarla con fines comerciales sin nuestro consentimiento previo por escrito.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "2.2. Te comprometes a utilizar la aplicación de manera responsable y a respetar los derechos de propiedad intelectual y otros derechos de terceros.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "2.3. No puedes utilizar la aplicación de una manera que pueda dañar, deshabilitar, sobrecargar o afectar el funcionamiento de nuestros servidores o redes.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "3. Contenido de Terceros",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "3.1. Nuestra aplicación puede contener enlaces a sitios web o servicios de terceros que no controlamos. No somos responsables del contenido, la exactitud o las prácticas de privacidad de estos sitios web o servicios.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "3.2. Cualquier contenido proporcionado por terceros a través de nuestra aplicación se ofrece únicamente con fines informativos. No respaldamos ni garantizamos la precisión, la integridad o la fiabilidad de este contenido.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "4. Privacidad",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "4.1. Respetamos tu privacidad y protegemos tus datos personales de acuerdo con nuestra Política de Privacidad, la cual forma parte integral de estos términos y condiciones.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "5. Modificaciones",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Nos reservamos el derecho de actualizar o modificar estos términos y condiciones en cualquier momento, se enviará un aviso a los usuarios de la aplicación al momento de realizar la modificación. Te recomendamos que revises periódicamente estos términos y condiciones para estar al tanto de cualquier cambio.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
