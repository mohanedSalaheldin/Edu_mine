import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/errors/error_strings.dart';
import '../../../../core/utils/widgets/loading_screen.dart';
import '../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../core/utils/widgets/server_error_screen.dart';
import '../cubit/mycourses_cubit.dart';
import '../widgets/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injector.dart' as di;

class CourseLecturesScreen extends StatelessWidget {
  final CourseEntity courseEntity;
  final bool isLectureChanged;
  const CourseLecturesScreen({
    super.key,
    required this.courseEntity,
    this.sectionURL,
    required this.isLectureChanged,
  });
  final String? sectionURL;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MycoursesCubit>(),
      child: BlocConsumer<MycoursesCubit, MycoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MycoursesGetMyCoursesLoading ||
              state is GetAllSectionsLoading) {
            return const LoadingScreen();
          } else if (state is MycoursesGetMyCoursesError) {
            if (state.msg == ErrorsString.noInternet) {
              return const NoConnectionScreen();
            } else {
              return const ServerErrorScreen();
            }
          
          } else {
            return buildBody(
              courseEntity: courseEntity,
              currentSectionURL: sectionURL ?? '',
              isChangeSection: isLectureChanged,
            );
          }
        },
      ),
    );
  }
}
