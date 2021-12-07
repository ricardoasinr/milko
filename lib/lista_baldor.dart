import 'package:flutter/material.dart';
import 'DetallePaciente.dart';
import 'persona.dart';
import 'service.dart';

class PersonasListView extends StatefulWidget {
  @override
  State<PersonasListView> createState() => _PersonasListViewState();
}

class _PersonasListViewState extends State<PersonasListView> {
  final ApiService apiService = ApiService();

  actualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ListTile _tile(int id, String? name, String? bd, int? edad, String? lat,
        String? long, bool? enfermo, bool? genero, int? nro) {
      Person person = Person(
        Id: id,
        FullName: name,
        Birthday: bd,
        Edad: edad,
        Latitud: lat,
        Longitud: long,
        IsInfected: enfermo,
        Gender: genero,
        NumeroTelf: nro,
      );

      return ListTile(
        title: Text('$name | ID: $id'),
        subtitle: Text('Edad: $edad | $bd'),
        leading: Icon(Icons.sentiment_very_dissatisfied_outlined),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detalle(person)),
          ).then((value) => actualizar());
        },
      );
    }

    ListView _personasListView(data) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(
            data.elementAt(index).Id,
            data.elementAt(index).FullName,
            data.elementAt(index).Birthday,
            data.elementAt(index).Edad,
            data.elementAt(index).Latitud,
            data.elementAt(index).Longitud,
            data.elementAt(index).IsInfected,
            data.elementAt(index).Gender,
            data.elementAt(index).NumeroTelf,
          );
        },
      );
    }

    Future<List<Person>> prueba() async {
      Future<List<Person>> x = apiService.getPersonas();
      List list = await x;
      print(list);
      return await x;
    }

    return FutureBuilder<List<Person>>(
      future: apiService.getPersonas(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
          List<Person>? data = snapshot.data;
          print(data);
          return _personasListView(data);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
