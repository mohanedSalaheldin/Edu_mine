import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/errors/error_strings.dart';
import '../../../../core/utils/widgets/loading_screen.dart';
import '../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../core/utils/widgets/server_error_screen.dart';
import '../../domain/entities/section_entity.dart';
import '../cubit/mycourses_cubit.dart';
import '../pages/course_lectures_screen.dart.dart';
import 'lecture_item_widget.dart';
import 'youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../injector.dart' as di;

Widget buildBody({
  required CourseEntity courseEntity,
  required String currentSectionURL,
  required bool isChangeSection,
}) {
  return BlocProvider(
    create: (context) => di.sl<MycoursesCubit>()
      ..getAllSections(courseID: courseEntity.courseID),
    child: BlocConsumer<MycoursesCubit, MycoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<SectionEntity> sectionsList = MycoursesCubit.get(context).sections;
        if (state is GetAllSectionsLoading) {
          return const LoadingScreen();
        }
        if (state is GetAllSectionsError) {
          return state.msg == ErrorsString.noInternet
              ? const NoConnectionScreen()
              : const ServerErrorScreen();
        }
        
        if (sectionsList.isEmpty && state is GetAllSectionsSuccess) {
           return const Center(child: Text("لا توجد محاضرات متاحة حالياً"));
        }

        return OrientationBuilder(
          builder: (context, orientation) {
            String activeUrl = isChangeSection ? currentSectionURL : (sectionsList.isNotEmpty ? sectionsList[0].url : '');
            
            if (orientation == Orientation.landscape) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: MyYouTubeWidget(
                  url: activeUrl,
                  courseID: courseEntity.courseID,
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    courseEntity.courseName,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Section
                    Container(
                      margin: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: MyYouTubeWidget(
                          url: activeUrl,
                          courseID: courseEntity.courseID,
                        ),
                      ),
                    ),
                    
                    // Info Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              courseEntity.tag,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "قائمة المحاضرات (${sectionsList.length})",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Lectures list
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          bool isSelected = sectionsList[index].url == activeUrl;
                          return buildLectureItem(
                            context: context,
                            sectionEntity: sectionsList[index],
                            onTap: () {
                              if (!isSelected) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => CourseLecturesScreen(
                                      courseEntity: courseEntity,
                                      isLectureChanged: true,
                                      sectionURL: sectionsList[index].url,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 10.h),
                        itemCount: sectionsList.length,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    ),
  );
}
