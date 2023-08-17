part of 'expenses_cubit.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class ExpensesLoading extends ExpensesState {}

class ExpensesLoaded extends ExpensesState {
  final List<dynamic> list;
  final List<double> pr;
  final List<Color> colors;

   ExpensesLoaded({required this.list,required this.pr,required this.colors,});
}
