import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/features/home/domain/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:e_learning/src/injector.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String uID = FirebaseAuth.instance.currentUser!.uid;
    return BlocProvider(
      create: (context) => di.sl<HomeScreenCubit>()
        ..getUserName(uID: uID)
        ..getUserCourses(uID: uID)
        ..getMonitors(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          if (state is HomeScreenGetUserDataLoading) {
            const LoadingScreen();
          }
        },
        builder: (context, state) {
          if (state is HomeScreenGetUserDataLoading) {
            return const LoadingScreen();
          }
          return Scaffold(
            // appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTopContainer(context),
                vericalGab(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    // height: ((ScreenSizes.getHieght(context) / 4) * 3) -
                    //     ScreenSizes.getHieght(context) / 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTitleAndMore(context, 'My Courses'),
                        vericalGab(),
                        _buildMyCoursesSection(context),
                        vericalGab(),
                        _buildTitleAndMore(
                          context,
                          "Monitors of The Week",
                        ),
                        vericalGab(),
                        _buildMonitorsSection(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _buildMonitorsSection(
    BuildContext context,
  ) {
    List<MonitorEntity> monitors = HomeScreenCubit.get(context).monitors;
    return SizedBox(
      height: ScreenSizes.getHieght(context) / 10,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildMonitorsCard(context, monitors[index]);
        },
        separatorBuilder: (context, index) {
          return horizentalGab();
        },
        itemCount: monitors.length,
      ),
    );
  }

  Row _buildTitleAndMore(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "See all",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
              ),
              horizentalGab(val: 5.0),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15.0,
                // color: Colors.white,
              ),
              horizentalGab(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyCoursesSection(BuildContext context) {
    double height = ScreenSizes.getHieght(context) / 2.6;
    double width = ScreenSizes.getWidth(context) / 1.45;
    List<CourseEntity> courses = HomeScreenCubit.get(context).userCourses;
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _myCourseCard(height, width, context, courses[index]);
        },
        separatorBuilder: (context, index) {
          return horizentalGab();
        },
        itemCount: courses.length,
      ),
    );
  }

  Widget _buildMonitorsCard(BuildContext context, MonitorEntity monitorEntity) {
    double height = ScreenSizes.getHieght(context) / 10;
    double width = ScreenSizes.getWidth(context) / 1.6;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(
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
            crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget _myCourseCard(double height, double width, BuildContext context,
      CourseEntity courseEntity) {
    int progress =
        ((courseEntity.doneSections / courseEntity.allSections) * 100).toInt();
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(10.0),

            height: height / 4,
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
                  HexColor('#23629f'),
                  HexColor('#21659e'),
                  HexColor('#0d9699'),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.wifi_tethering_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: (height - (height / 4)),
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                horizentalGab(val: width),
                Text(
                  courseEntity.tag,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      ),
                ),
                vericalGab(val: 5),
                Text(
                  courseEntity.courseName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                ),
                vericalGab(),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.wallet,
                        size: 20.0,
                      ),
                    ),
                    horizentalGab(),
                    Text(
                      courseEntity.instructor,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
                vericalGab(),
                Row(
                  children: [
                    Text(
                      "Section${courseEntity.doneSections}/${courseEntity.allSections}",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator.adaptive(
                            value: progress / 100,
                            valueColor:
                                AlwaysStoppedAnimation(HexColor('#2ba3a5')),
                          ),
                        ),
                        horizentalGab(val: 5),
                        Text(
                          "$progress%",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: HexColor('#2ba3a5'),
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                              ),
                        ),
                      ],
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

  Container _buildTopContainer(BuildContext context) {
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
}
