import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';
import 'package:e_learning/src/features/myCourses/domain/usecases/my_courses_get_user_courses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mycourses_state.dart';

class MycoursesCubit extends Cubit<MycoursesState> {
  final MyCoursesGetUserCoursesUsecase usecase;
  MycoursesCubit({required this.usecase}) : super(MycoursesInitial());
  static MycoursesCubit get(BuildContext context) => BlocProvider.of(context);

  List<CourseEntity> onGoingCourses = [];
  List<CourseEntity> doneCourses = [];
  void getUserCourses({required String uID}) async {
    emit(MycoursesGetMyCoursesLoading());
    Either<Failure, List<CourseEntity>> response = await usecase.call(uID: uID);
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
}
