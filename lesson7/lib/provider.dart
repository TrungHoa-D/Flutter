import 'package:flutter/material.dart';
import 'package:lesson7/service.dart';

class PersonProvider extends ChangeNotifier {
  bool isLoading = false;
  late List<Person> people;
  void getData() async {
    isLoading = true;
    people = await PersonServices.getData();
    isLoading = false;
    notifyListeners();
  }
}
