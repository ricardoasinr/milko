import 'package:covid_prueba/persona.dart';
import 'Registrar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url =
      "https://covidinfectadosoficial20211204191417.azurewebsites.net/api/People";
  Future<List<Person>> getPersonas() async {
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      //print(jsonResponse);
      /*List<Person> x = [new Person(Id: 1)];
      jsonResponse.forEach((element) {
        Person z = new Person.fromJSON(element);
        print(z.Id);
        print("Hola");
      });
      return x;*/

      return (jsonResponse as List)
          //.map((data) => new Person.fromJSON(data))
          .map((data) => Person.fromJSON(data))
          .toList();
    }

    throw Exception('Fallo');
  }

  Future<void> postPersona(Person nuevaPersona) async {
    Map data = {
      'id': 0,
      'fullName': nuevaPersona.FullName.toString(),
      'birthday': nuevaPersona.Birthday.toString(),
      'edad': nuevaPersona.Edad,
      'latitud': '129',
      'longitud': nuevaPersona.Longitud.toString(),
      'isInfected': nuevaPersona.IsInfected,
      'gender': nuevaPersona.Gender,
      'numeroTelf': nuevaPersona.NumeroTelf,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode != 201) throw Exception('Fallo al crear persona');
  }

  Future<void> putPersona(int? id, Person persona) async {
    Map data = {
      'id': id,
      'fullName': persona.FullName.toString(),
      'birthday': persona.Birthday.toString(),
      'edad': persona.Edad.toString(),
      'latitud': '129',
      'longitud': persona.Longitud.toString(),
      'isInfected': persona.IsInfected,
      'gender': persona.Gender,
      'numeroTelf': persona.NumeroTelf,
    };

    final response = await http.put(
      Uri.parse(url + '/$id'),
      headers: {
        //"Accept": "text/plain",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 204) throw Exception('No se, ta mal');
  }

  Future<void> deletePerson(int? id) async {
    print("id $id");
    final response = await http.delete(
      Uri.parse(url + '/$id'),
      headers: {
        //"Accept": "text/plain",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode != 204) throw Exception('No se, ta mal');
  }
}
