import 'package:e_learning/src/core/utils/consts/constatnts.dart';
import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildMonitorsCard(BuildContext context, MonitorEntity monitorEntity) {
  double height = ScreenSizes.getHieght(context) / 10;
  double width = ScreenSizes.getWidth(context) / 1.6;
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10.0,
    ),
    height: height,
    width: width,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: isAppThemeIsDark ? HexColor('#252727') : HexColor('#ffffff'),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          15.0,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          child: Icon(Icons.wallet),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              monitorEntity.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_outlined,
                  color: HexColor('#f0ac79'),
                ),
                Text(
                  monitorEntity.rate,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      ),
                ),
                Text(
                  "(${monitorEntity.reviews} Reviews)",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
