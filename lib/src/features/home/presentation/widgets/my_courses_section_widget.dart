import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:e_learning/src/features/home/presentation/widgets/course_card_widget.dart';
import 'package:flutter/material.dart';

Widget buildMyCoursesSection(BuildContext context) {
  double height = ScreenSizes.getHieght(context) / 2.6;
  double width = ScreenSizes.getWidth(context) / 1.45;
  List<CourseEntity> courses = HomeScreenCubit.get(context).userCourses;
  return SizedBox(
    height: height,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return myCourseCard(height, width, context, courses[index]);
      },
      separatorBuilder: (context, index) {
        return horizentalGab(val: 20.0);
      },
      itemCount: courses.length,
    ),
  );
}
