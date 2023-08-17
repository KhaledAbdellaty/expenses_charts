import 'package:equatable/equatable.dart';
import 'package:expenses/data/model/month_model.dart';
import 'package:expenses/data/model/week_model.dart';
import 'package:expenses/data/model/year_model.dart';

class ExpensesModel extends Equatable {
  final double totalSpent;
  final List<YearModel> yearModel;
  final List<MonthModel> monthModel;
  final List<WeekModel> weekModel;

  const ExpensesModel({
    required this.totalSpent,
    required this.yearModel,
    required this.monthModel,
    required this.weekModel,
  });
  factory ExpensesModel.fromJson(Map<String, dynamic> json) => ExpensesModel(
        totalSpent: json["total_spent"],
        yearModel:
            List.from(json["year"]).map((e) => YearModel.fromJson(e)).toList(),
        monthModel: List.from(json["month"])
            .map((e) => MonthModel.fromJson(e))
            .toList(),
        weekModel:
            List.from(json["week"]).map((e) => WeekModel.fromJson(e)).toList(),
      );
  @override
  List<Object?> get props => [
        totalSpent,
        yearModel,
        monthModel,
        weekModel,
      ];
}
