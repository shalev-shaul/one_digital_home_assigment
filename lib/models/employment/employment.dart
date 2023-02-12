import 'package:json_annotation/json_annotation.dart';

part 'employment.g.dart';

@JsonSerializable()
class Employment {
  final String title;
  final String key_skill;

  Employment({
    required this.title,
    required this.key_skill,
  });

  factory Employment.fromJson(Map<String, dynamic> json) => _$EmploymentFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentToJson(this);
}
