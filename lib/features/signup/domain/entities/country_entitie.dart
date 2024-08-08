// lib/features/login/domain/entities/country.dart
class Country {
  final String name;
  final String dialCode;
  final String? code;
  final String? flag;

  Country(
      {required this.name,
      required this.dialCode,
      required this.code,
      required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'],
      name: json['name'],
      dialCode: json['dial_code'],
      flag: json['image'],
    );
  }
}
