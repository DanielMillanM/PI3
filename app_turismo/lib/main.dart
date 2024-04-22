// ignore_for_file: prefer_const_constructors

import 'package:app_turismo/pages/buzon.dart';
import 'package:app_turismo/pages/map/body.dart';
import 'package:app_turismo/pages/sugerencias.dart';
import 'package:app_turismo/pages/user_config.dart';
import 'package:flutter/material.dart';
import 'package:app_turismo/pages/login_page.dart';
import 'package:app_turismo/pages/main_page.dart';
import 'package:app_turismo/pages/register_page.dart';
import 'package:app_turismo/pages/terminos_y_condiciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BucaraTismo',
      debugShowCheckedModeBanner: false,
      //home: MyTerminosYCondiciones(),
      home: MyMainPage(),
      
      routes: {
        '/main': (context) => MyMainPage(),
        '/login': (context) => MyLoginPage(),
        '/register': (context) => MyRegisterPage(),
        '/terminosycondiciones': (context) => MyTerminosYCondiciones(),
        '/bodyBuild': (context) => BodyBuild(),
        '/userconfig': (context) => UserConfig(),
        '/buzon': (context) => Buzon(),
        '/sugerencias': (context) => Sugerencias(),
      },
    );
  }
}