import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Row buildTitleAndMore(BuildContext context, String title) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 22.sp,
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: AppColor.textGrey,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).see_all,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12.sp,
            ),
          ],
        ),
      )
    ],
  );
}

