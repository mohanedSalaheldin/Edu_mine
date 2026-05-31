import 'package:e_learning/generated/l10n.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMyCouseCard({
  required double height,
  required BuildContext context,
  required void Function()? onTap,
  required CourseEntity courseEntity,
  bool isMyCourse = true,
}) {
  int progress = courseEntity.allSections > 0 
      ? ((courseEntity.doneSections / courseEntity.allSections) * 100).round()
      : 0;
  
  Color textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.05),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Image Side
            Container(
              width: 110.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(24.r)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.secondary1,
                    AppColor.secondary2,
                  ],
                ),
              ),
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.white,
                size: 40.sp,
              ),
            ),
            // Right Content Side
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColor.primary.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            courseEntity.tag,
                            style: TextStyle(
                              color: AppColor.primaryDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          courseEntity.rate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 12.sp,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      courseEntity.courseName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      courseEntity.instructor,
                      style: TextStyle(color: AppColor.textGrey, fontSize: 13.sp),
                    ),
                    const Spacer(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          isMyCourse
                              ? "${courseEntity.doneSections}/${courseEntity.allSections} Lessons"
                              : '${courseEntity.allSections} ${S.of(context).section}',
                          style: TextStyle(
                            color: textColor.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        const Spacer(),
                        if (isMyCourse)
                          Text(
                            "$progress%",
                            style: TextStyle(
                              color: AppColor.progressValue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    if (isMyCourse)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: LinearProgressIndicator(
                          value: courseEntity.allSections > 0 ? courseEntity.doneSections / courseEntity.allSections : 0,
                          backgroundColor: AppColor.progressBackground.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(AppColor.progressValue),
                          minHeight: 4.h,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
