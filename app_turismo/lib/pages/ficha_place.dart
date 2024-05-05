// ignore_for_file: unnecessary_const, unused_local_variable, unnecessary_import, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:app_turismo/estructures/comment_estructure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class MyFichaPlace extends StatefulWidget {
  final Function() updateFavorites;
  final int id;
  final String name;
  final String schedule;
  final String history;
  final String link;
  final String tag;

  const MyFichaPlace({
    Key? key,
    required this.updateFavorites,
    required this.id,
    required this.name,
    required this.schedule,
    required this.history,
    required this.link,
    required this.tag,
  }) : super(key: key);

  @override
  State<MyFichaPlace> createState() => _FichaPlaceState();
}

class _FichaPlaceState extends State<MyFichaPlace> {
  String? token;
  final commentController = TextEditingController();
  int rating = 1;
  List <CommentsEstructure> comments = [];

  @override
  void initState() {
    super.initState();
    loadToken();
  }

  // Método para cargar el token desde SharedPreferences
  void loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    comentarios(token.toString());
  }

  // Método para enviar una solicitud para agregar el lugar a favoritos
  void fetchData(String? access) async {
    try {
      final response = await http.post(
        Uri.parse('https://psychic-halibut-qxgqvqgqxx5244pw-8000.app.github.dev/place/favorite/'),
        headers: {'Authorization': 'JWT $access'},
        body: {'place_id': widget.id.toString()},
      );
      // Manejar la respuesta si es necesario
    } catch (error) {
      print(error);
    }
  }

  // Método para obtener comentarios del lugar
  void comentarios(String? access) async {
    try {
      final response = await http.get(
        Uri.parse('https://psychic-halibut-qxgqvqgqxx5244pw-8000.app.github.dev/comment/comments/${widget.id}'),
        headers: {'Authorization': 'JWT $access'},
      );

      final data = json.decode(response.body);
      print(data);

      data.forEach((place) {
        final commentObj = CommentsEstructure(
          User: place['name'],
          Comment: place['desc'],
          rate: place['rate'],
        );
        setState(() {
          comments.add(commentObj);
        });
      });
    } catch (error) {
      print(error);
    }
  }

  // Método para realizar un comentario
  void comentar(String access, int rating, String desc) async {
    try {
      final response = await http.post(
        Uri.parse('https://psychic-halibut-qxgqvqgqxx5244pw-8000.app.github.dev/comment/comments/${widget.id}/'),
        headers: {'Authorization': 'JWT $access'},
        body: {
          'comment': desc,
          'rate': rating.toString()
        },
      );

      final data = json.decode(response.body);
      print(data);

      data.forEach((place) {
        final commentObj = CommentsEstructure(
          User: place['name'],
          Comment: place['desc'],
          rate: place['rate'],
        );
        setState(() {});
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 90, 170),
        // icon arrow back color white
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.name, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              fetchData(token);
              widget.updateFavorites(); // Llama a la función de actualización
            },
            icon: Icon(
              Icons.star_border,
              color: Colors.orange,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              InstaImageViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.link,
                    height: screenHeight * 0.2,
                    fit: BoxFit.fitWidth,
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: screenHeight * 0.66,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 81, 90, 170),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Descripción',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.history,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      const Text(
                        'Horarios de atención:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.schedule,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      
                      const SizedBox(height: 16.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.comment, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text('Comentarios', style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      //espacio de comentario con rating
                      ListTile(
                        leading: SizedBox(
                          width: 60, // ajusta este tamaño según tus necesidades
                          child: DropdownButtonFormField<int>(
                            value: rating,
                            onChanged: (newValue) {
                              setState(() {
                                rating = newValue!;
                              });
                            },
                            items: List.generate(5, (index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text('${index + 1}'),
                              );
                            }),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        title: TextField(
                          controller: commentController,
                          decoration: const InputDecoration(
                            hintText: 'Escribe un comentario',
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          width: 80.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para enviar comentario y calificación
                              comentar(
                                token.toString(), 
                                rating, 
                                commentController.text
                              );
                            },
                            child: const Text('Enviar', style: TextStyle(fontSize: 10),),
                          ),
                        ),  
                      ),

                      const Divider(thickness: 4,),
                      const SizedBox(height: 16.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(comments[index].User),
                                subtitle: Text(comments[index].Comment),
                                trailing: Text(comments[index].rate.toString(), style: TextStyle(fontSize: 20),),
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      
    );
  }
}