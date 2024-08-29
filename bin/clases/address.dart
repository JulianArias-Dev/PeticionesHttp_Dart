import 'geo.dart';

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fronJson(Map<String, dynamic> json) {
    return Address(
      street: json['stret'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }

  @override
  String toString() {
    return "{ 'street' : $street , 'suite' : $suite , 'city' : $city , 'zipcode' : $zipcode , 'geo' : ${geo.toString()} , }";
  }
}
