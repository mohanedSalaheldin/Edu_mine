import '../../../../core/utils/app_color.dart';
import '../../domain/entities/monitors_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMonitorsCard(BuildContext context, MonitorEntity monitorEntity) {
  Color textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

  return Container(
    padding: EdgeInsets.all(12.r),
    margin: EdgeInsets.only(right: 12.w),
    width: 260.w,
    decoration: BoxDecoration(
      color: Theme.of(context).cardTheme.color,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 8.r,
          offset: Offset(0, 2.h),
        ),
      ],
      border: Border.all(
        color: Theme.of(context).dividerColor.withOpacity(0.05),
      ),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.primary, width: 2.w),
          ),
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColor.primary.withOpacity(0.1),
            child: Icon(Icons.person_rounded, color: AppColor.primaryDark, size: 24.sp),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monitorEntity.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: textColor,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    monitorEntity.rate,
                    style: TextStyle(
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "(${monitorEntity.reviews})",
                    style: TextStyle(
                      color: AppColor.textGrey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
