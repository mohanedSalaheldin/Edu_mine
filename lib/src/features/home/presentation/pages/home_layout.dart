import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/data_entry.dart';
import 'package:e_learning/src/features/allCourses/presentation/pages/all_courses_screen.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/home_screen.dart';
import 'package:e_learning/src/features/myCourses/presentation/pages/my_courses_screen.dart';
import 'package:e_learning/src/features/settings/presentation/pages/settings_screen.dart';

import '../cubit/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final List<Widget> screens = [
            const HomeScreen(),
            const AllCoursesScreen(),
            const MyLearnScreen(),
            const SettingsScreen(),
          ];
          var cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            body: SafeArea(child: screens[cubit.currentIndex]),
            bottomNavigationBar: _bulidNavBar(cubit, context),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bulidNavBar(
      HomeLayoutCubit cubit, BuildContext context) {
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: S.of(context).home,
        icon: const Icon(
          Icons.home,
        ),
      ),
      BottomNavigationBarItem(
        label: S.of(context).courses,
        icon: const Icon(
          Icons.school_rounded,
        ),
      ),
      BottomNavigationBarItem(
        label: S.of(context).my_learning,
        icon: const Icon(
          Icons.menu_book_rounded,
        ),
      ),
      BottomNavigationBarItem(
        label: S.of(context).settings,
        icon: const Icon(
          Icons.settings,
        ),
      ),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        cubit.changeNavBar(value);
      },
      items: items,
      currentIndex: cubit.currentIndex,
    );
  }
}
