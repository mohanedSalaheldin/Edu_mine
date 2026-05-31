import 'package:e_learning/src/core/utils/app_color.dart';
import '../../../../config/routes/navigation.dart';
import '../../../../core/utils/consts/constatnts.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../../../allCourses/presentation/pages/course_details_screen.dart';
import '../../../myCourses/presentation/pages/course_lectures_screen.dart.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget myCourseCard(
  double height,
  double width,
  BuildContext context,
  CourseEntity courseEntity,
) {
  int progress = ((courseEntity.doneSections / courseEntity.allSections) * 100).round();
  bool isEnrolled = courseEntity.doneSections != userCoursesIsEmptyCode;

  return GestureDetector(
    onTap: () {
      navigateTo(
        context: context,
        screen: !isEnrolled
            ? CourseDetailsScreen(courseEntity: courseEntity)
            : CourseLecturesScreen(courseEntity: courseEntity, isLectureChanged: false),
      );
    },
    child: Container(
      width: width,
      margin: EdgeInsets.only(right: 16.w, bottom: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Image / Header Section
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.secondary1,
                  AppColor.secondary2,
                  AppColor.secondary3,
                ],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.movie_filter_rounded,
                    color: Colors.white.withOpacity(0.3),
                    size: 60.sp,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      courseEntity.tag,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Info Section
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseEntity.courseName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppColor.primary.withOpacity(0.2),
                      child: Icon(Icons.person, size: 14.sp, color: AppColor.primaryDark),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        courseEntity.instructor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.textGrey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(height: 24.h),
                Row(
                  children: [
                    Icon(
                      Icons.collections_bookmark_rounded,
                      size: 16.sp,
                      color: AppColor.textGrey,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      !isEnrolled
                          ? '${courseEntity.allSections} Sections'
                          : '${courseEntity.doneSections}/${courseEntity.allSections} Lessons',
                      style: TextStyle(
                        color: AppColor.textGrey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    if (isEnrolled)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColor.progressValue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "$progress%",
                          style: TextStyle(
                            color: AppColor.progressValue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                  ],
                ),
                if (isEnrolled) ...[
                  SizedBox(height: 12.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: courseEntity.doneSections / courseEntity.allSections,
                      backgroundColor: AppColor.progressBackground.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.progressValue),
                      minHeight: 6.h,
                    ),
                  ),
                ],
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

