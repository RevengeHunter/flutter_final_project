class PlaceModel {
  PlaceModel({
    this.id,
    required this.name,
    required this.description,
    required this.numeroPiso,
    required this.status,
  });

  String? id;
  String name;
  String description;
  int numeroPiso;
  bool status;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    numeroPiso: json["numeroPiso"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "numeroPiso": numeroPiso,
    "status": status,
  };
}