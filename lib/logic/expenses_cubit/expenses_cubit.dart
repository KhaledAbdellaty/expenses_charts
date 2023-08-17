import 'package:expenses/data/model/expenses_model.dart';
import 'package:expenses/data/model/month_model.dart';
import 'package:expenses/data/model/week_model.dart';
import 'package:expenses/data/model/year_model.dart';
import 'package:expenses/data/repositories/repo.dart';
import 'package:expenses/logic/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());
  static ExpensesCubit of(BuildContext context) => BlocProvider.of(context);
  final oCcy = NumberFormat.simpleCurrency();
  final repo = Repo.instance;
  ExpensesModel? expensesModel;
  List<YearModel> year = [];
  List<MonthModel> month = [];
  List<WeekModel> week = [];
  int x = 0;
  Set<double> pr = {};
  Set<Color> colors = {};
  void getData(BuildContext context, int index) async {
    emit(ExpensesLoading());
    expensesModel = await repo.getExpenses();
    year.addAll(expensesModel!.yearModel);
    month.addAll(expensesModel!.monthModel);
    week.addAll(expensesModel!.weekModel);
    changeCategory(index);
  }
  
  void changeCategory(int index) {
    switch (index) {
      case 0:
        pr.clear();
        colors.clear();
        for (var day in week) {
          for (int i = 0; i < day.categoriesModel.categories.length; i++) {
            final element = day.categoriesModel.categories[i];
             pr.add(((element.spent / expensesModel!.totalSpent) * 100)
                .roundToDouble());
            colors.add(Color(int.parse(element.color)));
          }
          
        }
        emit(ExpensesLoaded(
            list: week, pr: pr.toList(), colors: colors.toList()));
        break;
      case 1:
        pr.clear();
        colors.clear();
        for (var day in month) {
           for (int i = 0; i < day.categoriesModel.categories.length; i++) {
            final element = day.categoriesModel.categories[i];
             pr.add(((element.spent / expensesModel!.totalSpent) * 100)
                .roundToDouble());
            colors.add(Color(int.parse(element.color)));
          }
        }
        emit(ExpensesLoaded(
            list: month, pr: pr.toList(), colors: colors.toList()));
        break;
      case 2:
        pr.clear();
        colors.clear();
        for (var day in year) {
            for (int i = 0; i < day.categoriesModel.categories.length; i++) {
            final element = day.categoriesModel.categories[i];
             pr.add(((element.spent / expensesModel!.totalSpent) * 100)
                .roundToDouble());
            colors.add(Color(int.parse(element.color)));
          }
        }
        emit(ExpensesLoaded(
            list: year, pr: pr.toList(), colors: colors.toList()));
        break;
    }
  }
}
