import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final List<CategoryModel> categories;
  const CategoriesModel({required this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
          categories: List.from(json["categories"])
              .map((e) => CategoryModel.fromJson(e))
              .toList());
  @override
  List<Object?> get props => [
        categories,
      ];
}

class CategoryModel extends Equatable {
  final String name, transaction, color;
  final num spent;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'],
        transaction: json["transaction"],
        color: json['color'],
        spent: json['spent'] ,
      );

  const CategoryModel({
    required this.name,
    required this.transaction,
    required this.color,
    required this.spent,
  });
  @override
  List<Object?> get props => [
        name,
        transaction,
        color,
        spent,
      ];
}
