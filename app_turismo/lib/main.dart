import 'package:app_turismo/views/buttonNavBar.dart';
import 'package:flutter/material.dart';

const Color darkBlue = Color(0xFF12202F);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      title: 'Every Flutter Widget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BucaraUWU'),
        ),
        // cambia el widget al que se quiere poner
        body: const ButtomNavBar(),
      ),
    );
  }
}
