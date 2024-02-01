import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/features/home/presentation/cubit/courses_cubit.dart';
import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Container buildTopContainer(BuildContext context) {
  return Container(
    padding: const EdgeInsetsDirectional.all(10.0),
    height: ScreenSizes.getHieght(context) / 4,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#1f2e3c'),
          HexColor('#162534'),
          HexColor('#0c1c2c'),
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  S.of(context).welcome_back,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      ),
                ),
                vericalGab(val: 5),
                Text(
                  "${HomeScreenCubit.get(context).userName} !🤘🏽",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                ),
              ],
            ),
          ],
        ),
        vericalGab(val: 15),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).best_courses_that,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                        height: .5,
                      ),
                ),
                Text(
                  S.of(context).suites_to_you,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                HomeLayoutCubit.get(context).changeNavBar(1);
              },
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
