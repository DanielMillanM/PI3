import 'package:app_turismo/views/googleMap.dart';
import 'package:flutter/material.dart';
import 'package:app_turismo/views/buttonNavBar.dart';

class BodyBuild extends StatefulWidget {
  const BodyBuild({super.key});

  @override
  State<BodyBuild> createState() => _BodyBuildState();
}

class _BodyBuildState extends State<BodyBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          ButtomNavBar(),
    );
  }
}