import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/core/utils/widgets/courses_lists_widget.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/core/utils/widgets/no_connection_screen.dart';
import 'package:e_learning/src/core/utils/widgets/server_error_screen.dart';
import 'package:e_learning/src/features/allCourses/presentation/cubit/allcourses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/src/injector.dart' as di;

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHieght(context) / 3.5;
    return BlocProvider(
      create: (context) => di.sl<AllcoursesCubit>()..getAllCourses(),
      child: BlocConsumer<AllcoursesCubit, AllcoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllcoursesLoading) {
            return const LoadingScreen();
          }
          if (state is GetAllcoursesError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Courses'),
            ),
            // backgroundColor: Colors.greenAccent,
            body: Container(
              child: buildCoursesListWidget(
                courses: AllcoursesCubit.get(context).allCourses,
                height: height,
                isMyCourses: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
