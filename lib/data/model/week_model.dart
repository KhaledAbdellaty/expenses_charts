import 'package:equatable/equatable.dart';
import 'package:expenses/data/model/categories_model.dart';

class WeekModel extends Equatable {
  final String name;
  final CategoriesModel categoriesModel;
  const WeekModel({
    required this.name,
    required this.categoriesModel,
  });
  factory WeekModel.fromJson(Map<String, dynamic> json) => WeekModel(
        name: json["day"],
        categoriesModel: CategoriesModel.fromJson(json),
      );
  @override
  List<Object?> get props => [name, categoriesModel];
}
