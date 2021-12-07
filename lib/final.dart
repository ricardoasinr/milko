import 'package:covid_prueba/Info.dart';
import 'package:covid_prueba/Registrar.dart';
import 'package:covid_prueba/main.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';
//import 'lista_vista.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
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
              'COVID-19 SCZ',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.blueGrey, Colors.red.shade900]),
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
                  image: AssetImage('assets/images/imagena.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                    2,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registrarse()),
                        );
                      },
                      child: const Text('Registrar paciente nuevo'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade800,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  2,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: const Text('Ver Registrados'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade800,
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  2,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text('Finalizar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
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
    );
  }
}
