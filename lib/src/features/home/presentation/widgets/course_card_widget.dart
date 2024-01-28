import 'package:e_learning/src/core/utils/consts/constatnts.dart';
import 'package:e_learning/src/core/utils/methods/choose_color.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/allCourses/presentation/pages/course_details_screen.dart';
import 'package:e_learning/src/features/myCourses/presentation/pages/course_lectures_screen.dart.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myCourseCard(
  double height,
  double width,
  BuildContext context,
  CourseEntity courseEntity,
) {
  int progress =
      ((courseEntity.doneSections / courseEntity.allSections) * 100).toInt();

  return InkWell(
    onTap: () {
      courseEntity.doneSections == userCoursesIsEmptyCode
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailsScreen(
                  courseEntity: courseEntity,
                ),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseLecturesScreen(
                  courseEntity: courseEntity,
                  isLectureChanged: false,
                ),
              ));
    },
    child: Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(10.0),
            height: height / 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor('#23629f'),
                  HexColor('#21659e'),
                  HexColor('#0d9699'),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.wifi_tethering_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: isAppThemeIsDark ? HexColor('#252727') : HexColor('#ffffff'),
            height: (height - (height / 4)),
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                horizentalGab(val: width),
                Text(
                  courseEntity.tag,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      ),
                ),
                vericalGab(val: 5),
                Text(
                  courseEntity.courseName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                ),
                vericalGab(),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.wallet,
                        size: 20.0,
                      ),
                    ),
                    horizentalGab(),
                    Text(
                      courseEntity.instructor,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
                vericalGab(),
                Row(
                  children: [
                    Text(
                      courseEntity.doneSections == userCoursesIsEmptyCode
                          ? '${courseEntity.allSections} Sections'
                          : "${courseEntity.doneSections}/${courseEntity.allSections}",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: const Color.fromARGB(255, 158, 158, 158),
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                    ),
                    const Spacer(),
                    courseEntity.doneSections == userCoursesIsEmptyCode
                        ? const SizedBox()
                        : Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator.adaptive(
                                  // value: progress / 100,
                                  value: (courseEntity.doneSections /
                                          courseEntity.allSections)
                                      .toDouble(),
                                  backgroundColor: HexColor('#bedddd'),
                                  valueColor: AlwaysStoppedAnimation(
                                      HexColor('#2ba3a5')),
                                ),
                              ),
                              horizentalGab(val: 5),
                              Text(
                                "$progress%",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: HexColor('#2ba3a5'),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
