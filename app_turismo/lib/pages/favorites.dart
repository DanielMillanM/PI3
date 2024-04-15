// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:app_turismo/estructures/place_estructure.dart';
import 'package:app_turismo/pages/ficha_place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {

  var token2;

  List<PlaceEstructure> favoritos = [];

  void fetchData(String access) async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.20.20:8000/place/favorite/'),
          headers: {
        'Authorization': 'JWT $access'
      },);

    final data = json.decode(response.body);
    print(data);
    data.forEach((place) {
      final placeData = place['place_detail'];
      final placeObj = PlaceEstructure(
        id: placeData['id'],
        name: placeData['name'],
        x: double.parse(placeData['x']),
        y: double.parse(placeData['y']),
        schedule: placeData['schedule'],
        history: placeData['history'],
        link: placeData['link'],
      );
      favoritos.add(placeObj);
    });

    // actualiza la pagina para crear la lista
    setState(() {});
      
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs){
      final token = prefs.getString('token');
      print(token);
      if(token != null){
        fetchData(token);
        token2 = token;
      }
    });
  }

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

              ...favoritos.map((favorito) {
                return ListTile(
                  leading: Icon(Icons.location_on, size: 40,),
                  title: Text("${favorito.name}"),
                  subtitle: Text("${favorito.history}"),
                  trailing: Icon(Icons.star, size: 40, color: Colors.orange,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyFichaPlace(
                          id: favorito.id,
                          name: favorito.name,
                          history: favorito.history,
                          schedule: favorito.schedule,
                          link: favorito.link,
                          updateFavorites: () {
                            // Define la función de actualización aquí
                            fetchData(token2);
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
              // ficha de lugar favorito
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