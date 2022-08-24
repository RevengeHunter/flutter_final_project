import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService{

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection("usuarios");

  Future<UserModel?> getUser(String emailUser) async {
    QuerySnapshot _querySnapshot =
    await _collectionReference.where('email', isEqualTo: emailUser).get();
    if (_querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot queryDocumentSnapshot = _querySnapshot.docs.first;
      UserModel userModel = UserModel.fromJson(
          queryDocumentSnapshot.data() as Map<String, dynamic>);
      userModel.id = queryDocumentSnapshot.id;
      return userModel;
    }
    return null;
  }

  Future<String> addUser(UserModel userModel) async {
    try {
      DocumentReference documentReference =
      await _collectionReference.add(userModel.toJson());
      return documentReference.id;
    } on TimeoutException catch (e) {
      return Future.error("Error 01 Message: $e");
    } on SocketException catch (e) {
      return Future.error("Error 02 Message: $e");
    } on Error catch (e) {
      return Future.error("Error 03 Message: $e");
    }
  }

  Future<UserModel?> getRoleUser(String email) async {
    QuerySnapshot querySnapshot =
    await _collectionReference.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot queryDocumentSnapshot = querySnapshot.docs.first;
      UserModel userModel = UserModel.fromJson(
          queryDocumentSnapshot.data() as Map<String, dynamic>);
      userModel.id = queryDocumentSnapshot.id;
      return userModel;
    }
    return null;
  }
  
}