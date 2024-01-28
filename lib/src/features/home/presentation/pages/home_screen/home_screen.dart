import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/methods/app_methods.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/core/utils/widgets/no_connection_screen.dart';
import 'package:e_learning/src/core/utils/widgets/server_error_screen.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_layout.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeScreenGetUserDataLoading ||
              state is HomeScreenGetMonitorsLoading ||
              state is HomeScreenGetUserCoursesLoading) {
            return const LoadingScreen();
          }
          if (state is HomeScreenGetUserCoursesError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          if (state is HomeScreenGetUserDataError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          if (state is HomeScreenGetMonitorsError) {
            return state.msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTopContainer(context),
                vericalGab(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: SizedBox(
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
                        vericalGab(),
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
