import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/core/utils/widgets/no_connection_screen.dart';
import 'package:e_learning/src/core/utils/widgets/server_error_screen.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/body_widget.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:e_learning/src/injector.dart' as di;

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
