import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Repository with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');

    try {
      _map = json.decode(jsonData);
      _error = false;
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
