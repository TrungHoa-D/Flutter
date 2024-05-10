import 'package:homework_7/model.dart';
import 'package:homework_7/services.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Person> people = [];
  late Province province;
  late District district;
  String presentProvince = '';
  Person thisPerson = Person();

  void getData() async {
    isLoading = true;
    people = await PersonServices.getData();
    isLoading = false;
    notifyListeners();
  }

  void addPerson() async {
    PersonServices.pushPerson(thisPerson);
    people.add(thisPerson);
    notifyListeners();
  }

  void getPerson(int index) {
    isLoading = true;
    thisPerson = people[index];
    presentProvince = province.findIDByName(thisPerson.provice);
    isLoading = false;
    //notifyListeners();
  }

  void updatePerson() async {
    PersonServices.updatePerson(thisPerson, thisPerson.id.toString());
    for (int i = 0; i < people.length; i++) {
      if (people[i].id == thisPerson.id) people[i] = thisPerson;
    }
    notifyListeners();
  }

  void removePerson(int index) async {
    PersonServices.deletePerson(people[index].id!);
    people.removeAt(index);
    notifyListeners();
  }

  void getProvinceData() async {
    isLoading = true;
    province = await ProvinceService.getData();
    isLoading = false;
    notifyListeners();
  }

  void getDistrictData(String id) async {
    isLoading = true;
    district = await DistrictService.getData(id);
    isLoading = false;
    notifyListeners();
  }

  void updateProvince(String name) {
    presentProvince = province.findIDByName(name);
    thisPerson.provice = name;
    getDistrictData(presentProvince);
    notifyListeners();
  }

  void listen() {
    notifyListeners();
  }

  void updateDistrict(String name) {
    thisPerson.district = name;
  }
}
