import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

Row buildSettingsHeaderWithUserDataAnDLogoutButton({
  required BuildContext context,
  required String userName,
  required String userEmail,
}) {
  if (userEmail.length > 8) {
    userEmail = '${userEmail.substring(0, 8)}*******.com';
  }

  return Row(
    children: [
      CircleAvatar(
        radius: 25.r,
        child: Icon(Icons.wallet, size: 24.sp),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0.sp,
                  ),
            ),
            SizedBox(height: 5.h),
            Text(
              userEmail,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0.sp,
                  ),
            ),
          ],
        ),
      ),
      TextButton(
        onPressed: () {
          SettingsCubit.get(context).logout();
        },
        child: Text(
          S.of(context).logout,
          style: TextStyle(
            decoration: TextDecoration.underline,
            height: 1.2,
            fontSize: 16.sp,
          ),
        ),
      ),
    ],
  );
}
