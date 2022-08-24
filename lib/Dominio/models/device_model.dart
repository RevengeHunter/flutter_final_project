class DeviceModel {
  DeviceModel({
    this.id,
    required this.userId,
    required this.deviceName,
    required this.watts,
    required this.hours,
    required this.piso,
    required this.status,
  });

  String? id;
  String userId;
  String deviceName;
  double watts;
  double hours;
  int piso;
  bool status;

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    id: json["id"],
    userId: json["userId"],
    deviceName: json["deviceName"],
    watts: json["watts"].toDouble(),
    hours: json["hours"].toDouble(),
    piso: json["piso"].toInt(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? "",
    "userId": userId,
    "deviceName": deviceName,
    "watts": watts,
    "hours": hours,
    "piso": piso,
    "status": status,
  };
}