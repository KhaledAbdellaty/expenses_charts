import 'package:expenses/core/manager/theme_manager.dart';
import 'package:expenses/logic/expenses_cubit/expenses_cubit.dart';
import 'package:expenses/logic/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:expenses/presentation/screens/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeManager.theme,
        darkTheme: ThemeManager.theme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TabBarCubit(),
            ),
            BlocProvider<ExpensesCubit>(
              create: (context) => ExpensesCubit()..getData(context, 0),
            ),
          ],
          child: const ExpensesScreen(),
        ));
  }
}
