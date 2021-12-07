import 'dart:convert';

import 'package:covid_prueba/Animation/FadeAnimation.dart';
import 'package:covid_prueba/persona.dart';
import 'package:covid_prueba/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DetallePaciente.dart';
import 'lista_vista.dart';
import 'package:http/http.dart' as http;

class iniciar extends StatefulWidget {
  const iniciar({Key? key}) : super(key: key);

  @override
  _iniciarState createState() => _iniciarState();
}

class _iniciarState extends State<iniciar> {
  TextEditingController _admin = TextEditingController();
  TextEditingController _password = TextEditingController();
  ApiService apiService = ApiService();

  final String urlAuthenticate =
      "https://covidinfectados.azurewebsites.net/api/Authenticate/login";

  login(String usuario, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(urlAuthenticate),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'username': usuario, 'password': password}));

    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print("Aqui");

      if (jsonResponse != null) {
        sharedPreferences.setString('token', jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => PersonasList()),
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding:
                const EdgeInsets.only(left: 130.0, top: 20.0, bottom: 20.0),
            child: new Text(
              'INICIO DE SESIÓN',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.lightBlue.shade900, Colors.lightBlue.shade900]),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 20.0,
                spreadRadius: 1.0,
              )
            ],
          ),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/imagenz.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[100]!,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: _admin,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nombre de usuario",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        ElevatedButton(
                          onPressed: () async {
                            await login(_admin.text.toString(),
                                _password.text.toString());
                          },
                          child: const Text('Ingresar'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink.shade600,
                              fixedSize: const Size(300, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
