import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyFichaPlace extends StatefulWidget {

  final Function() updateFavorites;

  final int id;
  final String name;
  final String schedule;
  final String history;
  final String link;

  const MyFichaPlace({
    super.key,
    required this.updateFavorites,
    required this.id,
    required this.name,
    required this.schedule,
    required this.history,
    required this.link,
    });

  @override
  State<MyFichaPlace> createState() => _FichaPlaceState();
}

class _FichaPlaceState extends State<MyFichaPlace> {

  String? token;

  void fetchData(String access) async {
    try {
      final response = await http
          .post(Uri.parse('http://192.168.20.20:8000/place/favorite/'),
          headers: {
        'Authorization': 'JWT $access'
      },
      body: {
          'place_id': widget.id.toString(),
      },
    );

    } catch (error) {
      print(error);
    }
  }

  void loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  @override
  void initState() {
    super.initState();
    loadToken();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            onPressed: () {
              fetchData(token!);
              widget.updateFavorites(); // Llama a la función de actualización
            }, 
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              widget.link,
              height: 200,
              ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.history,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Horarios de atención:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.schedule,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.comment),
                      SizedBox(width: 8.0),
                      Text('Comentarios'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions),
                      SizedBox(width: 8.0),
                      Text('¿Cómo llegar?'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Sugerencias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}