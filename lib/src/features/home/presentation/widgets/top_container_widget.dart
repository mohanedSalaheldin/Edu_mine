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
      // color: HexColor('#0c1c2c'),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            // bottomLeft: Radius.circular(15.0),
            // bottomRight: Radius.circular(15.0),
            ),
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
                    "Welcome back",
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
                    "Best Courses that ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    "suites to you",
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
                  // String uID = FirebaseAuth.instance.currentUser!.uid;
                  // HomeScreenCubit.get(context).getUserName(uID: uID);
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