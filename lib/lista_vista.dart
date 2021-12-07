import 'package:covid_prueba/DetallePaciente.dart';
import 'package:covid_prueba/iniciar_sesion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registrar.dart';
import 'lista_baldor.dart';

class PersonasList extends StatefulWidget {
  PersonasList({Key? key}) : super(key: key);

  @override
  _PersonasListState createState() => _PersonasListState();
}

class _PersonasListState extends State<PersonasList> {
late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => iniciar()),
        (Route<dynamic> route) => false,
      );
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "       Pacientes Registrados",
          style: TextStyle(color: Color(0xFF356859)),
        ),
        backgroundColor: Color(0xFFFFFBE6),
      ),
      body: Center(
        child: PersonasListView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF356859),
        tooltip: "Add student",
        splashColor: Color(0xFFFFFBE6),
        label: Text(
          "Add",
          style: TextStyle(
            color: Color(0xFFFFFBE6),
          ),
        ),
        icon: Icon(
          Icons.person_add,
          color: Color(0xFFFFFBE6),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Registrarse(),
            ),
          );
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
