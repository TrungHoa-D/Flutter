class Person {
  String? name;
  int? age;
  String? phoneNumber;
  bool? isCustommer;
  String? provice;
  String? district;
  String? id;

  Person(
      {this.name,
      this.age,
      this.phoneNumber,
      this.isCustommer,
      this.provice,
      this.district,
      this.id});
  void addAge() {
    age = age! + 1;
  }

  void removeAge() {
    age = age! - 1;
  }

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    phoneNumber = json['phone_number'];
    isCustommer = json['is_custommer'];
    provice = json['provice'];
    district = json['district'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['age'] = age;
    data['phone_number'] = phoneNumber;
    data['is_custommer'] = isCustommer;
    data['provice'] = provice;
    data['district'] = district;
    data['id'] = id;
    return data;
  }
}

class Province {
  List<Results>? results;

  Province({this.results});

  Province.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<String> toNameList() {
    List<String> name = [];
    for (int i = 0; i < results!.length; i++) {
      name.add(results![i].provinceName!);
    }
    return name;
  }

  String findIDByName(String? name) {
    for (int i = 0; i < results!.length; i++) {
      if (results![i].provinceName == name) {
        return results![i].provinceId!;
      }
    }
    return "";
  }

  String findNameById(String id) {
    for (int i = 0; i < results!.length; i++) {
      if (results![i].provinceId == id) {
        return results![i].provinceName!;
      }
    }
    return "";
  }
}

class Results {
  String? provinceId;
  String? provinceName;
  String? provinceType;

  Results({this.provinceId, this.provinceName, this.provinceType});

  Results.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    provinceType = json['province_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['province_type'] = provinceType;
    return data;
  }
}

class District {
  List<DistrictResults>? results;

  District({this.results});

  District.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <DistrictResults>[];
      json['results'].forEach((v) {
        results!.add(DistrictResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<String> toNameList() {
    List<String> name = [];
    for (int i = 0; i < results!.length; i++) {
      name.add(results![i].districtName!);
    }
    return name;
  }
}

class DistrictResults {
  String? districtId;
  String? districtName;
  String? districtType;
  Null lat;
  Null lng;
  String? provinceId;

  DistrictResults(
      {this.districtId,
      this.districtName,
      this.districtType,
      this.lat,
      this.lng,
      this.provinceId});

  DistrictResults.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    districtName = json['district_name'];
    districtType = json['district_type'];
    lat = json['lat'];
    lng = json['lng'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['district_type'] = districtType;
    data['lat'] = lat;
    data['lng'] = lng;
    data['province_id'] = provinceId;
    return data;
  }
}
