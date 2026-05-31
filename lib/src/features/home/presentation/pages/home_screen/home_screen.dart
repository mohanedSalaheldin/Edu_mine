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
          if (state is HomeScreenGetUserCoursesError ||
              state is HomeScreenGetUserDataError ||
              state is HomeScreenGetMonitorsError) {
            final msg = (state as dynamic).msg;
            return msg == ErrorsString.noInternet
                ? const NoConnectionScreen()
                : const ServerErrorScreen();
          }

          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  buildTopContainer(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 0, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: buildTitleAndMore(
                            context,
                            S.of(context).latest_courses,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buildMyCoursesSection(context),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: buildTitleAndMore(
                            context,
                            S.of(context).monitors_of_the_week,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buildMonitorsSection(context),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

