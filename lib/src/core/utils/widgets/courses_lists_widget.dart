import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/allCourses/presentation/pages/course_details_screen.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'package:e_learning/src/features/myCourses/presentation/pages/course_lectures_screen.dart.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/my_course_card_widget.dart';
import 'package:flutter/material.dart';

Widget buildCoursesListWidget({
  required double height,
  required List<CourseEntity> courses,
  required bool isMyCourses,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildMyCouseCard(
              height: height,
              context: context,
              courseEntity: courses[index],
              onTap: () {
                if (!isMyCourses) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailsScreen(
                        courseEntity: courses[index],
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseLecturesScreen(
                          courseEntity: courses[index],
                          isLectureChanged: false,
                        ),
                      ));
                }
              },
              isMyCourse: isMyCourses,
            ),
            separatorBuilder: (context, index) => vericalGab(val: 10.0),
            itemCount: courses.length,
          ),
        ),
      ],
    ),
  );
}
