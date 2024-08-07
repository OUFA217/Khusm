// lib/features/login/domain/entities/country.dart
class Country {
  final String name;
  final String dialCode;

  Country({required this.name, required this.dialCode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      dialCode: json['dial_code'],
    );
  }
}
