import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final int index;
  final void Function(int) onPressed;
  final List<String> tabsHead;
  final Widget child;
  final PageController pageController;
  const TabBarWidget({
    super.key,
    required this.index,
    required this.onPressed,
    required this.pageController,
    required this.tabsHead,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabBarHeader(context, index, onPressed, tabsHead),
        Expanded(child: child)
      ],
    );
  }

  Widget tabBarHeader(BuildContext context, int stateIndex,
      Function(int) onPressed, List<String> tabs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        tabs.length,
        (index) => InkWell(
          onTap: () => onPressed(index),
          child: SizedBox(
            height: 35,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: stateIndex == index
                  ? Theme.of(context).textTheme.headlineMedium!
                  : Theme.of(context).textTheme.headlineSmall!,
              child: Text(
                tabs[index],
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
