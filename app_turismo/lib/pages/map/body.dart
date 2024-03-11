import 'package:app_turismo/pages/map/button_nav_bar.dart';
import 'package:flutter/material.dart';

class BodyBuild extends StatefulWidget {
  const BodyBuild({super.key});

  @override
  State<BodyBuild> createState() => _BodyBuildState();
}

class _BodyBuildState extends State<BodyBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ButtomNavBar(),
      ),
    );
  }
}