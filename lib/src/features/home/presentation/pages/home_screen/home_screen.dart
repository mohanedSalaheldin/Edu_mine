import 'package:e_learning/generated/l10n.dart';

import '../../../../../core/errors/error_strings.dart';
import '../../../../../core/utils/widgets/app_widgets.dart';
import '../../../../../core/utils/widgets/loading_screen.dart';
import '../../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../../core/utils/widgets/server_error_screen.dart';
import 'cubit/home_screen_cubit.dart';
import '../../widgets/monitors_section_widget.dart';
import '../../widgets/my_courses_section_widget.dart';
import '../../widgets/top_container_widget.dart';
import '../../widgets/title_and_more_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../injector.dart' as di;

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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildTopContainer(context),
                vericalGab(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 20.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTitleAndMore(
                          context,
                          S.of(context).latest_courses,
                        ),
                        vericalGab(),
                        buildMyCoursesSection(context),
                        vericalGab(val: 5),
                        buildTitleAndMore(
                          context,
                          S.of(context).monitors_of_the_week,
                        ),
                        vericalGab(val: 5),
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
