import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/utils/widgets/courses_lists_widget.dart';
import 'package:e_learning/src/core/utils/widgets/no_courses_screen.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'package:e_learning/src/features/myCourses/presentation/pages/course_lectures_screen.dart.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/my_course_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/src/injector.dart' as di;

// import 'package:hexcolor/hexcolor.dart';

class MyLearnScreen extends StatelessWidget {
  const MyLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // int currentTap = 0;
    double height = ScreenSizes.getHieght(context) / 3.5;
    // double width = ScreenSizes.getWidth(context) / 1.45;
    return BlocProvider(
      create: (context) => di.sl<MycoursesCubit>()
        ..getUserCourses(uID: FirebaseAuth.instance.currentUser!.uid),
      child: BlocConsumer<MycoursesCubit, MycoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  onTap: (value) {},
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ongoing',
                          ),
                          horizentalGab(
                            val: 5,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Completed',
                          ),
                          horizentalGab(
                            val: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: const Text('My Courses'),
              ),
              body: TabBarView(
                //  "You are not enrolled in any course yet...Do it now!"
                children: [
                  MycoursesCubit.get(context).onGoingCourses.isEmpty
                      ? const NoCoursesScreen(
                          txt:
                              'You are not enrolled in any course ...Do it now!')
                      : buildCoursesListWidget(
                          courses: MycoursesCubit.get(context).onGoingCourses,
                          height: height,
                          isMyCourses: true,
                        ),
                  MycoursesCubit.get(context).doneCourses.isEmpty
                      ? const NoCoursesScreen(
                          txt:
                              'You have not completed any course yet ...Do it now!')
                      : buildCoursesListWidget(
                          courses: MycoursesCubit.get(context).doneCourses,
                          height: height,
                          isMyCourses: true,
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
