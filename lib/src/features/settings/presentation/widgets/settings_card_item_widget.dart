import '../../../../core/utils/widgets/app_widgets.dart';
import '../cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Container settingItemCard({
    required BuildContext context,
    required String txt,
    required Widget settingControllerWidget,
    required IconData iconData,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isAppThemeIsDark ? HexColor('#252727') : HexColor('#ffffff'),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(iconData),
            horizentalGab(),
            Text(
              txt,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
            ),
            const Spacer(),
            settingControllerWidget,
          ],
        ),
      ),
    );
  }