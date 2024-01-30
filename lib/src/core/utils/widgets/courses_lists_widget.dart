import '../../../config/routes/navigation.dart';
import '../../entities/my_courses_entity.dart';
import 'app_widgets.dart';
import '../../../features/allCourses/presentation/pages/course_details_screen.dart';
import '../../../features/myCourses/presentation/pages/course_lectures_screen.dart.dart';
import '../../../features/myCourses/presentation/widgets/my_course_card_widget.dart';
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
                  navigateTo(
                    context: context,
                    screen: CourseDetailsScreen(
                      courseEntity: courses[index],
                    ),
                  );
                } else {
                  navigateTo(
                    context: context,
                    screen: CourseLecturesScreen(
                      courseEntity: courses[index],
                      isLectureChanged: false,
                    ),
                  );
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
