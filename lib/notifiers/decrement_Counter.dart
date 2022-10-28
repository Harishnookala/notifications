import 'package:flutter/material.dart';
class UserDetailsProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  int _age = 0;
  String _userName = '';
  int get userAge => _age;
  String get userName => _userName;
  void updateAge(int age) {
    _age = age;
    notifyListeners();
  }
  void updateName(String name) {
    _userName = name;
    notifyListeners();
  }
}