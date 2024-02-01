import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';

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
      const CircleAvatar(
        radius: 25,
        child: Icon(Icons.wallet),
      ),
      horizentalGab(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          vericalGab(val: 5),
          Text(
            userEmail,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                ),
          ),
        ],
      ),
      const Spacer(),
      TextButton(
        onPressed: () {
          SettingsCubit.get(context).logout();
        },
        child: Text(
          S.of(context).logout,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            height: 1.2,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
