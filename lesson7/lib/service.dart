import 'dart:convert';

import 'package:http/http.dart' as http;

class Person {
  String? name;
  int? age;
  String? id;

  Person({this.name, this.age, this.id});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['age'] = age;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class PersonServices {
  static Future<List<Person>> getData() async {
    late List<Person> tmp;
    var response = await http.get(Uri.parse(
        'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/Person'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body) as List<Map<String, dynamic>>;
      tmp = List.generate(body.length, (index) => Person.fromJson(body[index]));
    } else {}
    return tmp;
  }
}
