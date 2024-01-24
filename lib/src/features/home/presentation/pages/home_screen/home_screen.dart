import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:e_learning/src/features/home/presentation/widgets/monitors_section_widget.dart';
import 'package:e_learning/src/features/home/presentation/widgets/my_courses_section_widget.dart';
import 'package:e_learning/src/features/home/presentation/widgets/top_container_widget.dart';
import 'package:e_learning/src/features/home/presentation/widgets/title_and_more_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                buildTopContainer(context),
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
                        buildTitleAndMore(
                          context,
                          'Latest Courses',
                        ),
                        vericalGab(),
                        buildMyCoursesSection(context),
                        vericalGab(),
                        buildTitleAndMore(
                          context,
                          "Monitors of The Week",
                        ),
                        vericalGab(),
                        buildMonitorsSection(context),
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
}
