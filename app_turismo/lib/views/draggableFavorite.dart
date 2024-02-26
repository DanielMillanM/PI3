import 'package:app_turismo/main.dart';
import 'package:app_turismo/views/body.dart';
import 'package:flutter/material.dart';

DraggableScrollableSheet favModal(BuildContext context) {
  return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.1,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Center(
              child: ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
            ),
          );
        },
      );
}
