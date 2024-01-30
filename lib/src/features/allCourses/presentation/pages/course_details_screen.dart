import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/errors/error_strings.dart';
import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../../../core/utils/widgets/loading_screen.dart';
import '../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../core/utils/widgets/see_more_text_widget.dart';
import '../../../../core/utils/widgets/server_error_screen.dart';
import '../cubit/allcourses_cubit.dart';
import '../../../auth/presentation/widgets/auth_widgets.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../injector.dart' as di;

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key, required this.courseEntity});
  final CourseEntity courseEntity;

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHieght(context);

    return BlocProvider(
      create: (context) => di.sl<AllcoursesCubit>()
        ..isCourseAlreadyEnrolled(courseID: courseEntity.courseID),
      child: BlocConsumer<AllcoursesCubit, AllcoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllcoursesLoading ||
              state is IsCourseEnrolledLoading) {
            return const LoadingScreen();
          }
          if (state is IsCourseEnrolledError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          if (state is EnrollInCourseError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultButton(
                color: AllcoursesCubit.get(context).enrollmentCheckResult
                    ? Colors.grey[800]
                    : null,
                context: context,
                content: Text(
                  AllcoursesCubit.get(context).enrollmentCheckResult
                      ? 'Already Enrolled'
                      : 'Enroll',
                ),
                onpressed: AllcoursesCubit.get(context).enrollmentCheckResult
                    ? () {}
                    : () {
                        AllcoursesCubit.get(context)
                          ..enrollInCourse(courseID: courseEntity.courseID)
                          ..isCourseAlreadyEnrolled(
                              courseID: courseEntity.courseID);
                      },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          height: height / 2.8,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              courseEntity.poster,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: height - (height / 2.8),
                            decoration: BoxDecoration(
                              color: isAppThemeIsDark
                                  ? HexColor('#252727')
                                  : HexColor('#ffffff'),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  30,
                                ),
                                topRight: Radius.circular(
                                  30,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                right: 30,
                                left: 30,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: ScreenSizes.getWidth(context),
                                    ),
                                    Text(
                                      courseEntity.courseName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    vericalGab(),
                                    Text(
                                      'By: ${courseEntity.instructor}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    vericalGab(),
                                    Row(
                                      children: [
                                        IconWithStatisticWidget(
                                          statistics:
                                              "${courseEntity.rate} (${courseEntity.reviews}k Reviews)",
                                          iconData: Icons.star_outlined,
                                        ),
                                      ],
                                    ),
                                    vericalGab(val: 20.0),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.video_collection_outlined,
                                        ),
                                        horizentalGab(),
                                        Text(
                                          '${courseEntity.allSections} Sections',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    vericalGab(val: 30.0),
                                    Text(
                                      'Description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    vericalGab(),
                                    SeeMoreTextWidget(
                                      text: courseEntity.description,
                                    ),
                                    vericalGab(val: 100.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FloatingActionButton.small(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  // color: HexColor('#f0ac79'),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class IconWithStatisticWidget extends StatelessWidget {
  const IconWithStatisticWidget({
    super.key,
    required this.statistics,
    this.iconData,
  });
  final String statistics;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(
            iconData,
            color: HexColor('#f0ac79'),
            size: 30,
          ),
        ),
        horizentalGab(val: 5.0),
        Text(
          statistics,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
        ),
      ],
    );
  }
}
