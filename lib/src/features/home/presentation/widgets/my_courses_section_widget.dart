import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../pages/home_screen/cubit/home_screen_cubit.dart';
import 'course_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildMyCoursesSection(BuildContext context) {
  double height = 320.h; // زيادة الارتفاع ليتناسب مع المحتوى الجديد
  double width = 260.w;
  List<CourseEntity> courses = HomeScreenCubit.get(context).userCourses;
  return SizedBox(
    height: height,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return myCourseCard(height, width, context, courses[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 4.w); // تقليل المسافة لأن الكارت أصلاً فيه margin
      },
      itemCount: courses.length,
    ),
  );
}
