import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _ClaseID = '';
  String get ClaseID => _ClaseID;
  set ClaseID(String value) {
    _ClaseID = value;
  }

  String _ProfesorID = '';
  String get ProfesorID => _ProfesorID;
  set ProfesorID(String value) {
    _ProfesorID = value;
  }

  String _Timestamp = '';
  String get Timestamp => _Timestamp;
  set Timestamp(String value) {
    _Timestamp = value;
  }

  bool _boton = false;
  bool get boton => _boton;
  set boton(bool value) {
    _boton = value;
  }
}
