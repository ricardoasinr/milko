class Person {
  int Id;
  String? FullName;
  String? Birthday;
  int? Edad;
  String? Latitud;
  String? Longitud;
  bool? IsInfected;
  bool? Gender;
  int? NumeroTelf;
  Person({
    required this.Id,
    this.FullName,
    this.Birthday,
    this.Edad,
    this.Latitud,
    this.Longitud,
    this.IsInfected,
    this.Gender,
    this.NumeroTelf,
  });
  factory Person.fromJSON(Map<String, dynamic> json) {
    return Person(
      Id: json['id'],
      FullName: json['fullName'],
      Birthday: json['birthday'],
      Edad: json['edad'],
      Latitud: json['latitud'],
      Longitud: json['longitud'],
      IsInfected: json['isInfected'],
      Gender: json['gender'],
      NumeroTelf: json['numeroTelf'],
    );
  }
}
