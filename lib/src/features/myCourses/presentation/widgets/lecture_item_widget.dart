import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';

import '../../domain/entities/section_entity.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildLectureItem({
  required BuildContext context,
  required SectionEntity sectionEntity,
  required void Function()? onTap,
}) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  
  return Container(
    margin: EdgeInsets.only(bottom: 2.h),
    decoration: BoxDecoration(
      color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            // Index Number
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  sectionEntity.number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sectionEntity.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    sectionEntity.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            
            // Status Icon
            Icon(
              sectionEntity.isWatched
                  ? Icons.check_circle_rounded
                  : Icons.play_circle_outline_rounded,
              color: sectionEntity.isWatched 
                  ? Colors.green 
                  : (isDark ? Colors.white54 : Colors.black45),
              size: 24.sp,
            ),
          ],
        ),
      ),
    ),
  );
}
