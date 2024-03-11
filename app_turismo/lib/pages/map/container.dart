// ignore_for_file: avoid_unnecessary_containers

import 'package:app_turismo/pages/map/google_map.dart';
import 'package:flutter/material.dart';

class ReturnContainer extends StatefulWidget {
  const ReturnContainer({super.key});

  @override
  State<ReturnContainer> createState() => _ReturnContainerState();
}

class _ReturnContainerState extends State<ReturnContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapScreen(),
    );
  }
}