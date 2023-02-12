import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable()
class CreditCard {
  final String cc_number;

  CreditCard({required this.cc_number});

  factory CreditCard.fromJson(Map<String, dynamic> json) => _$CreditCardFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardToJson(this);
}
