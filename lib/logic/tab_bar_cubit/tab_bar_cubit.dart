import 'package:equatable/equatable.dart';
import 'package:expenses/core/extenstions.dart';
import 'package:expenses/logic/expenses_cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/manager/string_manager.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState());
  static TabBarCubit of(BuildContext context) => BlocProvider.of(context);
  final PageController _pageController = PageController()..addListener(() {});
  PageController get pageController => _pageController;
  final List<String> headers = const [
    StringManager.week,
    StringManager.month,
    StringManager.year
  ];
  increamentDetailsLayout() {
    emit(state.copyWith(listIndex: state.listIndex + 1));

    pageController.animateToPage(state.listIndex,
        duration: 500.dms, curve: Curves.linearToEaseOut);
  }

  changeTo(int value) {
    emit(state.copyWith(listIndex: value));

    pageController.animateToPage(value,
        duration: 500.dms, curve: Curves.linearToEaseOut);
  }

  decreamentDetailsLayout() {
    if (state.listIndex > 0) {
      emit(state.copyWith(listIndex: state.listIndex - 1));
      pageController.animateToPage(state.listIndex,
          duration: 500.dms, curve: Curves.linearToEaseOut);
    }
  }

  changeIndex(int index, BuildContext context) {
    ExpensesCubit.of(context).getData(context, index);
    emit(state.copyWith(index: index));
  }
}
