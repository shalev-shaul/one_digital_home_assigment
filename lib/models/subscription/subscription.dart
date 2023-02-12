import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  final String plan;
  final String status;
  final String payment_method;
  final String term;

  Subscription({
    required this.plan,
    required this.status,
    required this.payment_method,
    required this.term,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
