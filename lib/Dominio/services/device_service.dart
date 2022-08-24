import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final_project/Dominio/global_data/sp_global.dart';
import 'package:flutter_final_project/Dominio/models/device_model.dart';

class DeviceService {
  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("dispositivos");

  final SPGlobal _sp = SPGlobal();

  Future<List<DeviceModel>> getDevice() async {
    QuerySnapshot _querySnapshot =
        await _collectionReference.where('userId', isEqualTo: _sp.id).get();

    if (_querySnapshot.docs.isNotEmpty) {
      List<QueryDocumentSnapshot> queryDocumentSnapshot = _querySnapshot.docs;
      print(queryDocumentSnapshot[0].data());
      List<DeviceModel> deviceList = queryDocumentSnapshot.map((e) {
        DeviceModel deviceModel = DeviceModel.fromJson(e.data() as Map<String, dynamic>);
        deviceModel.id = e.id;
        return deviceModel;
      }).toList();

      return deviceList;
    }
    return [];
  }

  Future<String> addDevice(DeviceModel deviceModel) async {
    try {
      DocumentReference documentReference =
          await _collectionReference.add(deviceModel.toJson());
      return documentReference.id;
    } on TimeoutException catch (e) {
      return Future.error("Error 01 Message: $e");
    } on SocketException catch (e) {
      return Future.error("Error 02 Message: $e");
    } on Error catch (e) {
      return Future.error("Error 03 Message: $e");
    }
  }
}
