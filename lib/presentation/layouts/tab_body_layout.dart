import 'package:expenses/core/extenstions.dart';
import 'package:expenses/logic/expenses_cubit/expenses_cubit.dart';
import 'package:expenses/presentation/layouts/detailes_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/douhnut_chart_widget.dart';

class TabBodyLayout extends StatelessWidget {
  const TabBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        return AnimatedSwitcher(
            duration: 2000.dms,
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.easeInOutQuart,
            child: state is ExpensesLoaded
                ? NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          floating: true,
                          expandedHeight: context.width / 1.2,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Padding(
                              padding: 40.psh,
                              child: AnimatedDoughnutChart(
                                percentages: state.pr,
                                colors: state.colors,
                                totalSpent: ExpensesCubit.of(context)
                                    .expensesModel!
                                    .totalSpent,
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: DetailesPageLayout(
                      expensesList: state.list,
                    ))
                : const Center(
                    // child: Text("In Expenses Initial state"),
                    ));
      },
    );
  }
}
