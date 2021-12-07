import 'package:covid_prueba/persona.dart';
import 'package:covid_prueba/service.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

enum Opciones { si, no }
enum Sexo { masculino, femenino }

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  TextEditingController _nombre = TextEditingController();

  TextEditingController _fechaNacimiento = TextEditingController();

  TextEditingController _edad = TextEditingController();

  TextEditingController _nroTelefono = TextEditingController();

  TextEditingController _direccion = TextEditingController();

  ApiService apiService = ApiService();

  Opciones? _opciones = Opciones.si;

  Sexo? _sexo = Sexo.masculino;

  bool _esMasculino = true;

  bool _estaEnfermo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.5,
                      Text(
                        "NOMBRE COMPLETO",
                        style: TextStyle(
                          color: Color.fromRGBO(143, 148, 251, 1),
                        ),
                      ),
                    ),
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
                                controller: _nombre,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " ",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              1.5,
                              Text(
                                "FECHA DE NACIMIENTO",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
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
                                        controller: _fechaNacimiento,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: " ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1.5,
                                      Text(
                                        "EDAD",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _edad,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: " ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1.5,
                                      Text(
                                        "DIRECCION",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _direccion,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: " ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1.5,
                                      Text(
                                        "SEXO",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      title: const Text('Masculino'),
                                      leading: Radio<Sexo>(
                                        value: Sexo.masculino,
                                        groupValue: _sexo,
                                        onChanged: (Sexo? value) {
                                          setState(
                                            () {
                                              _sexo = value;

                                              if (_sexo == Sexo.masculino)
                                                _esMasculino = true;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Femenino'),
                                      leading: Radio<Sexo>(
                                        value: Sexo.femenino,
                                        groupValue: _sexo,
                                        onChanged: (Sexo? value) {
                                          setState(() {
                                            _sexo = value;

                                            if (_sexo == Sexo.femenino)
                                              _esMasculino = false;
                                          });
                                        },
                                      ),
                                    ),

                                    // google maps

                                    SizedBox(
                                      height: 25,
                                    ),
                                    FadeAnimation(
                                      1.5,
                                      Text(
                                        "¿ESTA INFECTADO?",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      title: const Text('Sí'),
                                      leading: Radio<Opciones>(
                                        value: Opciones.si,
                                        groupValue: _opciones,
                                        onChanged: (Opciones? value) {
                                          setState(() {
                                            _opciones = value;

                                            if (_opciones == Opciones.si)
                                              _estaEnfermo = true;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('No'),
                                      leading: Radio<Opciones>(
                                        value: Opciones.no,
                                        groupValue: _opciones,
                                        onChanged: (Opciones? value) {
                                          setState(() {
                                            _opciones = value;
                                            if (_opciones == Opciones.no)
                                              _estaEnfermo = false;
                                          });
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1.5,
                                      Text(
                                        "NUMERO DE TELEFONO",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _nroTelefono,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: " ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                          ),
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
                                          Person nuevaPersona = Person(
                                            Id: 0,
                                            FullName: _nombre.text.toString(),
                                            Birthday: _fechaNacimiento.text
                                                .toString(),
                                            Edad: int.parse(
                                                _edad.text.toString()),
                                            Longitud:
                                                _direccion.text.toString(),
                                            Gender: _esMasculino,
                                            IsInfected: _estaEnfermo,
                                            NumeroTelf: int.parse(
                                                _nroTelefono.text.toString()),
                                          );

                                          await apiService
                                              .postPersona(nuevaPersona);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Info(),
                                            ),
                                          );
                                        },
                                        child: const Text('Registrarse'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          fixedSize: const Size(300, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
