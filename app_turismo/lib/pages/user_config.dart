import 'package:flutter/material.dart';

class UserConfig extends StatefulWidget {
  const UserConfig({Key? key}) : super(key: key);

  @override
  State<UserConfig> createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  String _username = "User1";
  String _password = "Contrasena";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _username;
    _passwordController.text = _password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración del perfil"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre de usuario",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _usernameController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: _username,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Contraseña",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: _password,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isEditing) {
                      _username = _usernameController.text;
                      _password = _passwordController.text;
                    }
                    _isEditing = !_isEditing;
                  });
                },
                child: Text(_isEditing ? "Guardar" : "Editar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}