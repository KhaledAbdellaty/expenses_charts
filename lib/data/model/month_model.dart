import 'package:equatable/equatable.dart';
import 'package:expenses/data/model/categories_model.dart';

class MonthModel extends Equatable {
  final String name;
  final CategoriesModel categoriesModel;
  const MonthModel({required this.name, required this.categoriesModel});

  factory MonthModel.fromJson(Map<String, dynamic> json) => MonthModel(
      name: json["month"], categoriesModel: CategoriesModel.fromJson(json));

  @override
  List<Object?> get props => [name, categoriesModel];
}

