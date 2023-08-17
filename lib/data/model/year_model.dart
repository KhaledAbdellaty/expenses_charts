import 'package:equatable/equatable.dart';
import 'package:expenses/data/model/categories_model.dart';

class YearModel extends Equatable {
  final String name;
  final CategoriesModel categoriesModel;
  const YearModel({
    required this.name,
    required this.categoriesModel,
  });
  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
      name: json["year"], categoriesModel: CategoriesModel.fromJson(json));
  @override
  List<Object?> get props => [name, categoriesModel];
}
