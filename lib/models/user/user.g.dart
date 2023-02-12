// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      uid: json['uid'] as String,
      password: json['password'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      gender: json['gender'] as String,
      phone_number: json['phone_number'] as String,
      social_insurance_number: json['social_insurance_number'] as String,
      date_of_birth: DateTime.parse(json['date_of_birth'] as String),
      employment:
          Employment.fromJson(json['employment'] as Map<String, dynamic>),
      credit_card:
          CreditCard.fromJson(json['credit_card'] as Map<String, dynamic>),
      subscription:
          Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'phone_number': instance.phone_number,
      'social_insurance_number': instance.social_insurance_number,
      'date_of_birth': instance.date_of_birth.toIso8601String(),
      'employment': instance.employment,
      'credit_card': instance.credit_card,
      'subscription': instance.subscription,
    };
