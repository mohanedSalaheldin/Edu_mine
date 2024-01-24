import 'package:e_learning/data_entery.dart';
import 'package:e_learning/src/features/home/presentation/cubit/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(),
      child: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CoursesCubit.get(context);

          return Scaffold(
            // floatingActionButton: FloatingActionButton(onPressed: () {
            //   DataEntery.addLecture();
            // }),
            body: SafeArea(child: cubit.screens[cubit.currentIndex]),
            bottomNavigationBar: _bulidNavBar(cubit),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bulidNavBar(CoursesCubit cubit) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        cubit.changeNavBar(value);
      },
      items: cubit.items,
      currentIndex: cubit.currentIndex,
    );
  }
}
