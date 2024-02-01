import 'package:e_learning/generated/l10n.dart';

import '../../../../core/errors/error_strings.dart';
import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/courses_lists_widget.dart';
import '../../../../core/utils/widgets/loading_screen.dart';
import '../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../core/utils/widgets/server_error_screen.dart';
import '../cubit/allcourses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injector.dart' as di;

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHieght(context) / 3.5;
    return BlocProvider(
      create: (context) => di.sl<AllcoursesCubit>()..getAllCourses(),
      child: BlocConsumer<AllcoursesCubit, AllcoursesState>(
        listener: (context, state) {
          
        },
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
              title: Text(S.of(context).courses),
            ),
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
