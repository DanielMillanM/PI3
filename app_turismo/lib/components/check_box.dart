// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app_turismo/pages/terminos_y_condiciones.dart';

class MyCheckBox extends StatefulWidget {
  final String console;
  final String checkBoxText;
  final String buttonText;

  const MyCheckBox({
    super.key,
    required this.console,
    required this.checkBoxText,
    required this.buttonText,
    });

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  // valor predeterminado del checkbox
  bool isChecked = false;

  void printMessage() {
    print(widget.console);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(widget.checkBoxText, style: TextStyle(color: Colors.white, fontSize: 14)),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyTerminosYCondiciones()));
              },
              child: Text(
                "Términos y Condiciones",
                style: TextStyle(color: Colors.blue, fontSize: 14,),
              )
            ),
          ]
        ),
        
        MaterialButton(
          onPressed: isChecked? printMessage:null,
          textColor: Colors.white,
          color: Colors.blue,
          child: Text(widget.buttonText),
        )
      ]
    );
  }
}