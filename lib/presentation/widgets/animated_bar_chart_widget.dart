import 'package:expenses/core/extenstions.dart';
import 'package:expenses/core/manager/string_manager.dart';
import 'package:expenses/data/model/categories_model.dart';
import 'package:flutter/material.dart';

import '../../logic/expenses_cubit/expenses_cubit.dart';

class AnimatedBarChartWidget extends StatefulWidget {
  final CategoryModel category;

  final double width;
  const AnimatedBarChartWidget(
      {super.key, required this.width, required this.category});

  @override
  State<AnimatedBarChartWidget> createState() => _AnimatedBarChartWidgetState();
}

class _AnimatedBarChartWidgetState extends State<AnimatedBarChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sweepAngleAnimation;
  late Animation<double> _spentAnimation;
  late Animation<double> _percentageAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: 1.ds, vsync: this);
    _sweepAngleAnimation =
        Tween<double>(begin: 0, end: widget.width).animate(_controller);
    _spentAnimation =
        Tween<double>(begin: 0, end: widget.category.spent.toDouble())
            .animate(_controller);
    _percentageAnimation =
        Tween<double>(begin: 0, end: widget.category.spent.toDouble())
            .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final expensesCubit = ExpensesCubit.of(context);
    return Container(
      padding: 5.p,
      width: context.width,
      height: context.height / 10.5,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _sweepAngleAnimation,
            builder: (context, child) => Container(
              width: _sweepAngleAnimation.value,
              color: widget.category.color.strToColor.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: 5.p,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.store,
                    color: widget.category.color.strToColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.category.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.category.transaction +
                                StringManager.transaction,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                    animation: _spentAnimation,
                    builder: (context, child) {
                      return Expanded(
                        flex: 2,
                        child: Padding(
                          padding: 5.psv,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  _spentAnimation.value.currency,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  _percentageAnimation.value.percentage(
                                      expensesCubit.expensesModel!.totalSpent),
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
