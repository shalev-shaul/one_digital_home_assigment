import 'package:one_digital_home_assigment/models/coordinates/coordinates.dart';

import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String city;
  final String street_name;
  final String street_address;
  final String zip_code;
  final String state;
  final String country;
  final Coordinates coordinates;

  Address({
    required this.city,
    required this.street_name,
    required this.street_address,
    required this.zip_code,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
