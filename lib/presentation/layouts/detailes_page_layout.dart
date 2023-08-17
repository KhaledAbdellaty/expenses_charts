import 'package:expenses/core/extenstions.dart';
import 'package:expenses/data/model/categories_model.dart';
import 'package:expenses/logic/expenses_cubit/expenses_cubit.dart';
import 'package:expenses/logic/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/animated_bar_chart_widget.dart';

class DetailesPageLayout extends StatelessWidget {
  final List<dynamic> expensesList;
  const DetailesPageLayout({
    super.key,
    required this.expensesList,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ExpensesCubit.of(context);
    final tabBloc = TabBarCubit.of(context);
    return Column(
      children: [
        BlocBuilder<TabBarCubit, TabBarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: tabBloc.state.listIndex == 0
                      ? null
                      : () => tabBloc.decreamentDetailsLayout(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                Text(
                  expensesList[tabBloc.state.listIndex].name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () => tabBloc.increamentDetailsLayout(),
                  icon: const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Expanded(
          child: PageView.builder(
            controller: tabBloc.pageController,
            itemCount: expensesList.length,
            onPageChanged: (value) => tabBloc.changeTo(value),
            itemBuilder: (context, index) {
              final CategoriesModel categories =
                  expensesList[index].categoriesModel;
              return ListView.builder(
                padding: 12.p,
                physics: const BouncingScrollPhysics(),
                itemCount: categories.categories.length,
                itemBuilder: (context, index) {
                  final category = categories.categories[index];
                  double width =
                      (category.spent / bloc.expensesModel!.totalSpent) *
                          context.width;

                  return AnimatedBarChartWidget(
                    key: ValueKey(category),
                    width: width,
                    category: category,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
