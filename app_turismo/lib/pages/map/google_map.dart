// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_import, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';

import 'package:app_turismo/estructures/place_estructure.dart';
import 'package:app_turismo/pages/ficha_place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoicGl0bWFjIiwiYSI6ImNsY3BpeWxuczJhOTEzbnBlaW5vcnNwNzMifQ.ncTzM4bW-jpq-hUFutnR1g';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  var token2;
  
  List<PlaceEstructure> places = [];


  LatLng? myPosition;

  void fetchData(String access) async {
    try {
      final response = await http
          .get(Uri.parse('https://psychic-halibut-qxgqvqgqxx5244pw-8000.app.github.dev/place/places/'),
          headers: {
        'Authorization': 'JWT $access'
      },);

    final data = json.decode(response.body);
    print(data);
    data.forEach((user) {
      final place = PlaceEstructure(
        id: user['placeId'],
        name: user['name'],
        x: double.parse(user['x']),
        y: double.parse(user['y']),
        schedule: user['schedule'],
        history: user['history'],
        link: user['link'],
        tag: user['tagName'],
      );
      places.add(place);
    });

    // actualiza la pagina para crear la lista
    setState(() {});
      
    } catch (error) {
      print(error);
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
      print(myPosition);
    });
  }

  @override
  void initState() {
    getCurrentLocation();
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
        body: myPosition == null
            ? Center(child: const CircularProgressIndicator())
            : Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 1000,
                    child: FlutterMap(
                      options: MapOptions(
                          center: myPosition, minZoom: 5, maxZoom: 25, zoom: 18),
                      nonRotatedChildren: [
                        TileLayer(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                          additionalOptions: const {
                            'accessToken': MAPBOX_ACCESS_TOKEN,
                            'id': 'mapbox/streets-v12'
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: myPosition!,
                              builder: (context) {
                                return Container(
                                  child: const Icon(
                                    Icons.person_pin_circle,
                                    color: Colors.blueAccent,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                            ...places.map((place) {
                              return Marker(
                                point: LatLng(place.y, place.x),
                                builder: (context) {
                                  return Container(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context) => MyFichaPlace(
                                              id: place.id, 
                                              name: place.name, 
                                              history: place.history, 
                                              schedule: place.schedule, 
                                              link: place.link, 
                                              tag: place.tag,
                                              updateFavorites: () {
                                                fetchData(token2);
                                              },
                                              )
                                            )
                                          );
                                      },
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    )
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    margin: EdgeInsets.only(top: 10),
                    child: EasySearchBar(
                      backgroundColor: Colors.white,
                      appBarHeight: 100,
                      title: Text("Buscar lugar"),
                      suggestions: places.map((place) => place.name).toList(),
                      onSearch: (value) {
                        print(value);
                      },
                      onSuggestionTap: (value) {
                        final selectedPlace = places.firstWhere((place) => place.name == value);
                        Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => MyFichaPlace(
                            id: selectedPlace.id, 
                            name: selectedPlace.name, 
                            history: selectedPlace.history, 
                            schedule: selectedPlace.schedule, 
                            link: selectedPlace.link, 
                            tag: selectedPlace.tag,
                              updateFavorites: () {
                                fetchData(token2);
                              },
                            )
                          )
                        );
                      },
                    )
                  )
                ],
              )));
  }
}
