import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../pages/home_screen/cubit/home_screen_cubit.dart';
import 'course_card_widget.dart';
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
