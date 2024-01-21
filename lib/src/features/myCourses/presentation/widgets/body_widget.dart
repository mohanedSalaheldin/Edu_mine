import 'package:e_learning/data_entery.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/lecture_item_widget.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:e_learning/src/injector.dart' as di;

Widget buildBody({
  required BuildContext context,
  required YoutubePlayerController controller,
  required CourseEntity courseEntity,
}) {
  return BlocProvider(
    create: (context) => di.sl<MycoursesCubit>()
      ..getAllSections(courseID: courseEntity.courseID),
    child: BlocConsumer<MycoursesCubit, MycoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     DataEntery.addLecture();
          //   },
          // ),
          // appBar: AppBar(),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildYouTube(controller: controller),
                vericalGab(val: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Course Name',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              // fontWeight: FontWeight.w500,
                              fontSize: 26,
                            ),
                      ),
                      vericalGab(val: 10.0),
                      Text(
                        'Course Name',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                      ),
                    ],
                  ),
                ),
                vericalGab(val: 20.0),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => buildLectureItem(
                        context, MycoursesCubit.get(context).sections[index]),
                    separatorBuilder: (context, index) => vericalGab(val: 30.0),
                    itemCount: MycoursesCubit.get(context).sections.length,
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
