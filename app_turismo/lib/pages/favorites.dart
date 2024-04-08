// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Tus Favoritos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.location_on, size: 40,),
                title: Text("Nombre Lugar"),
                subtitle: Text("Descripción"),
                trailing: Icon(Icons.star, size: 40,),
                onTap: () {
                  // llamar a la página de detalles del lugar
                },
              )
            ]
          ),
        )
      ),
    );
  }
}