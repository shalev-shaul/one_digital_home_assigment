import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:one_digital_home_assigment/models/credit_card/credit_card.dart';
import 'package:one_digital_home_assigment/models/employment/employment.dart';
import 'package:one_digital_home_assigment/models/subscription/subscription.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String uid;
  final String password;
  final String first_name;
  final String last_name;
  final String username;
  final String email;
  final String avatar;
  final String gender;
  final String phone_number;
  final String social_insurance_number;
  final DateTime date_of_birth;
  final Employment employment;
  final CreditCard credit_card;
  final Subscription subscription;

  User({
    required this.id,
    required this.uid,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.phone_number,
    required this.social_insurance_number,
    required this.date_of_birth,
    required this.employment,
    required this.credit_card,
    required this.subscription,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        uid,
        password,
        first_name,
        last_name,
        username,
        email,
        avatar,
        gender,
        phone_number,
        social_insurance_number,
        date_of_birth,
        employment,
        credit_card,
        subscription
      ];
}
