import 'dart:convert';
import 'package:homework_7/model.dart';
import 'package:http/http.dart' as http;

class PersonServices {
  static Future<List<Person>> getData() async {
    late List<Person> tmp;
    var response = await http.get(
      Uri.parse(
          'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer'),
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      String decodedResponse = utf8.decode(responseBody.codeUnits);
      var body = jsonDecode(decodedResponse) as List<dynamic>;
      tmp = List.generate(body.length, (index) => Person.fromJson(body[index]));
    } else {
      // something
    }
    return tmp;
  }

  static Future<void> pushPerson(Person person) async {
    final response = await http.post(
      Uri.parse(
          'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(person.toJson()),
    );

    if (response.statusCode == 201) {
      //print('Person pushed successfully');
    } else {
      throw Exception(
          'Failed to push person. Error code: ${response.statusCode}');
    }
  }

  static Future<void> updatePerson(Person person, String id) async {
    final response = await http.put(
      Uri.parse(
          'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(person.toJson()),
    );

    if (response.statusCode == 201) {
      //print('Person pushed successfully');
    } else {
      throw Exception(
          'Failed to push person. Error code: ${response.statusCode}');
    }
  }

  static Future<void> deletePerson(String id) async {
    final response = await http.delete(
      Uri.parse(
          'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      //print('Person pushed successfully');
    } else {
      throw Exception(
          'Failed to push person. Error code: ${response.statusCode}');
    }
  }
}

class ProvinceService {
  static Future<Province> getData() async {
    late Province tmp;
    var response = await http.get(
      Uri.parse('https://vapi.vnappmob.com/api/province'),
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      String decodedResponse = utf8.decode(responseBody.codeUnits);
      var body = jsonDecode(decodedResponse) as dynamic;
      tmp = Province.fromJson(body);
    } else {
      // something
    }
    return tmp;
  }
}

class DistrictService {
  static Future<District> getData(String id) async {
    late District tmp;
    var response = await http.get(
      Uri.parse('https://vapi.vnappmob.com/api/province/district/$id'),
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      String decodedResponse = utf8.decode(responseBody.codeUnits);
      var body = jsonDecode(decodedResponse) as dynamic;
      tmp = District.fromJson(body);
    } else {
      // something
    }
    return tmp;
  }
}
