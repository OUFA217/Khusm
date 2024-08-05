import 'package:khusm/features/home/domain/entities/test_entitie.dart';

class TestModel extends TestEntitie {
  const TestModel({
    required super.id,
    required super.url,
    required super.value,
    required super.iconUrl,
    required super.createdAt,
    required super.updatedAt,
    required super.categories,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    List<String> categories = [];

    if (json.containsKey('categories')) {
      List<dynamic> inconmingCategories = json['categories'] as List;
      for (var element in inconmingCategories) {
        categories.add(element);
      }
    }

    return TestModel(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      value: json['value'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      categories: categories,
    );
  }
}
