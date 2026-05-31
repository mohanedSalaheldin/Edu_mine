import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/utils/app_color.dart';
import 'package:e_learning/src/features/home/presentation/cubit/courses_cubit.dart';
import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';

Container buildTopContainer(BuildContext context) {
  final cubit = HomeScreenCubit.get(context);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    height: ScreenSizes.getHieght(context) / 3.8,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColor.darkBackground1,
          AppColor.darkBackground2,
          AppColor.darkBackground3,
        ],
      ),
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person_rounded, color: Colors.white),
              ),
            ),
            horizentalGab(val: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).welcome_back,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "${cubit.userName} !🤘🏽",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).best_courses_that,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    S.of(context).suites_to_you,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                HomeLayoutCubit.get(context).changeNavBar(1);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.textBlack,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

