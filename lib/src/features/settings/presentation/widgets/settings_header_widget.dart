import '../../../../core/utils/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

Row buildSettingsHeaderWithUserDataAnDLogoutButton({
    required BuildContext context,
    required String userName,
    required String userEmail,
  }) {
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
          onPressed: () {},
          child: const Text(
            'Logout',
            style: TextStyle(
              decoration: TextDecoration.underline,
              height: 1.2,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }