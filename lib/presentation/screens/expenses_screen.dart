import 'package:expenses/core/manager/string_manager.dart';
import 'package:expenses/logic/expenses_cubit/expenses_cubit.dart';
import 'package:expenses/presentation/layouts/tab_body_layout.dart';
import 'package:expenses/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/tab_bar_cubit/tab_bar_cubit.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabBarCubit = TabBarCubit.of(context);
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                StringManager.expenses,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            body: BlocBuilder<TabBarCubit, TabBarState>(
              builder: (context, state) {
                return TabBarWidget(
                  index: state.index,
                  onPressed: (index) => tabBarCubit.changeIndex(index, context),
                  pageController: tabBarCubit.pageController,
                  tabsHead: tabBarCubit.headers,
                  child: const TabBodyLayout(),
                );
              },
            ));
      },
    );
  }
}
