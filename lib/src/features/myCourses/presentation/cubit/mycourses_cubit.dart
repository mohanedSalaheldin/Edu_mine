import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';
import 'package:e_learning/src/features/myCourses/domain/usecases/get_all_sections_usecase.dart';
import 'package:e_learning/src/features/myCourses/domain/usecases/my_courses_get_user_courses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'mycourses_state.dart';

class MycoursesCubit extends Cubit<MycoursesState> {
  final MyCoursesGetUserCoursesUsecase myCoursesGetUserCoursesUsecase;
  final GetAllSectionsUsecase getAllSectionsUsecase;
  MycoursesCubit({
    required this.myCoursesGetUserCoursesUsecase,
    required this.getAllSectionsUsecase,
  }) : super(MycoursesInitial());
  static MycoursesCubit get(BuildContext context) => BlocProvider.of(context);

  List<CourseEntity> onGoingCourses = [];
  List<CourseEntity> doneCourses = [];
  void getUserCourses({required String uID}) async {
    emit(MycoursesGetMyCoursesLoading());
    Either<Failure, List<CourseEntity>> response =
        await myCoursesGetUserCoursesUsecase.call(uID: uID);
    response.fold((failure) {
      emit(MycoursesGetMyCoursesError());
    }, (courses) {
      for (var element in courses) {
        if (element.doneSections == element.allSections) {
          doneCourses.add(element);
        } else {
          onGoingCourses.add(element);
        }
      }
      emit(MycoursesGetMyCoursesSuccess());
    });
  }

  List<SectionEntity> sections = [];
  void getAllSections({required String courseID}) async {
    emit(GetAllSectionsLoading());
    Either<Failure, List<SectionEntity>> response =
        await getAllSectionsUsecase.call(courseID: courseID);
    response.fold((failure) {
      emit(GetAllSectionsError());
    }, (value) {
      sections = value;
      emit(GetAllSectionsSuccess());
    });
  }
}
