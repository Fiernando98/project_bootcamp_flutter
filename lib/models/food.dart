class Food {
  int? id;
  int? idServer;
  String? name;
  double? calories;

  Food(
      {required this.id,
      required this.idServer,
      required this.name,
      required this.calories});

  Food.fromMapSQL(Map<String, dynamic> mapSQL) {
    id = mapSQL["id"];
    idServer = mapSQL["idServer"];
    name = mapSQL["name"];
    calories = double.tryParse("${mapSQL["calories"]}");
  }

  Map<String, dynamic> toMapSQL() {
    return {"id": id, "idServer": idServer, "name": name, "calories": calories};
  }
}
