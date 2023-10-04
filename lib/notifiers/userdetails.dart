import 'package:flutter/material.dart';
class UserDetailsProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  List age =[];
  List name = [];
  List get userAge => age;
  List get userName => name;
  void updateAge(int age) {
    userAge.add(age);
    notifyListeners();
  }
  void updateName(String name) {
    userName.add(name);
    notifyListeners();
  }

}