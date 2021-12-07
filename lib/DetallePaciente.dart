import 'package:covid_prueba/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';
import 'Registrar.dart';
import 'lista_vista.dart';
import 'persona.dart';

enum Opciones { si, no }
enum Sexo { masculino, femenino }

class Detalle extends StatefulWidget {
  Person persona;
  Detalle(this.persona);

  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  TextEditingController _id = TextEditingController();
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
  void initState() {
    super.initState();
    _id.text = widget.persona.Id.toString();
    _nombre.text = widget.persona.FullName.toString();
    _fechaNacimiento.text = widget.persona.Birthday.toString();
    _edad.text = widget.persona.Edad.toString();
    _nroTelefono.text = widget.persona.NumeroTelf.toString();
    _direccion.text = widget.persona.Longitud.toString();
    _esMasculino = true;
    _estaEnfermo = true;
  }

  bool editable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding:
                const EdgeInsets.only(left: 115.0, top: 20.0, bottom: 20.0),
            child: new Text(
              'Detalle del Paciente',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              Colors.lightGreen.shade200,
              Colors.lightGreen.shade200
            ]),
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
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: _id,
                  enabled: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Id",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _nombre,
                  enabled: editable,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Nombre",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  enabled: editable,
                  controller: _fechaNacimiento,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Fecha de Nacimiento",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _edad,
                  enabled: editable,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Edad",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _direccion,
                  enabled: editable,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Direccion",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
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
                      color: Color.fromRGBO(143, 148, 251, 1),
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

                          if (_sexo == Sexo.masculino) _esMasculino = true;
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

                        if (_sexo == Sexo.femenino) _esMasculino = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "¿ESTA INFECTADO?",
                  style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                  ),
                ),
                ListTile(
                  title: const Text('Sí'),
                  leading: Radio<Opciones>(
                    value: Opciones.si,
                    groupValue: _opciones,
                    onChanged: (Opciones? value) {
                      setState(() {
                        _opciones = value;

                        if (_opciones == Opciones.si) _estaEnfermo = true;
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
                        if (_opciones == Opciones.no) _estaEnfermo = false;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _nroTelefono,
                  enabled: editable,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Numero de telefono",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                  2,
                  ElevatedButton(
                    onPressed: () {
                      if (editable) {
                        Person persona = Person(
                          Id: int.parse(_id.text),
                          FullName: _nombre.text,
                          Birthday: _fechaNacimiento.text,
                          Edad: int.parse(_edad.text),
                          Longitud: _direccion.text,
                          NumeroTelf: int.parse(_nroTelefono.text),
                          Gender: _esMasculino,
                          IsInfected: _estaEnfermo,
                        );
                        //apiService.putPerson(int.parse(_id.text.toString(), ))
                        Navigator.pop(context);
                      }

                      setState(() {
                        editable = !editable;
                      });
                    },
                    child: const Text('Editar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                  2,
                  ElevatedButton(
                    onPressed: () {
                      apiService.deletePerson(int.parse(_id.text.toString()));
                      Navigator.pop(context);
                    },
                    child: const Text('Eliminar Paciente'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  2,
                  ElevatedButton(
                    onPressed: () async {
                      Person nuevaPersona = Person(
                        Id: 0,
                        FullName: _nombre.text.toString(),
                        Birthday: _fechaNacimiento.text.toString(),
                        Edad: int.parse(_edad.text.toString()),
                        Longitud: _direccion.text.toString(),
                        Gender: _esMasculino,
                        IsInfected: _estaEnfermo,
                        NumeroTelf: int.parse(_nroTelefono.text.toString()),
                      );

                      await apiService.putPersona(
                          int.parse(_id.text.toString()), nuevaPersona);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonasList(),
                        ),
                      );
                    },
                    child: const Text('GUARDAR'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
