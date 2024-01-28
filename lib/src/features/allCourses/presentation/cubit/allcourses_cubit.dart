import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/enroll_in_course_usecase.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/get_all_courses_usecase.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/is_inrolled_in_the_course_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'allcourses_state.dart';

class AllcoursesCubit extends Cubit<AllcoursesState> {
  AllcoursesCubit({
    required this.getAllCoursesUseCase,
    required this.enrollInCourseUseCase,
    required this.isEnrolledInCourseUseCase,
  }) : super(AllcoursesInitial());
  final GetAllCoursesUseCase getAllCoursesUseCase;
  final EnrollInCourseUseCase enrollInCourseUseCase;
  final IsEnrolledInCourseUseCase isEnrolledInCourseUseCase;

  static AllcoursesCubit get(BuildContext context) => BlocProvider.of(context);

  List<CourseEntity> allCourses = [];
  void getAllCourses() async {
    emit(GetAllcoursesLoading());
    Either<Failure, List<CourseEntity>> response =
        await getAllCoursesUseCase.call();
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const GetAllcoursesError(msg: ErrorsString.noInternet));
        } else {
          emit(const GetAllcoursesError(msg: ErrorsString.serverError));
        }
      },
      (courses) {
        allCourses = courses;
        emit(GetAllcoursesSuccess());
      },
    );
  }

  void enrollInCourse({required String courseID}) async {
    emit(EnrollInCourseLoading());
    Either<Failure, Unit> response =
        await enrollInCourseUseCase.call(courseID: courseID);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const EnrollInCourseError(msg: ErrorsString.noInternet));
        } else {
          emit(const EnrollInCourseError(msg: ErrorsString.serverError));
        }
      },
      (r) {
        emit(EnrollInCourseSuccess());
      },
    );
  }

  bool enrollmentCheckResult = false;
  void isCourseAlreadyEnrolled({required String courseID}) async {
    emit(IsCourseEnrolledLoading());
    Either<Failure, bool> response =
        await isEnrolledInCourseUseCase.call(courseID: courseID);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const IsCourseEnrolledError(msg: ErrorsString.noInternet));
        } else {
          emit(const IsCourseEnrolledError(msg: ErrorsString.serverError));
        }
      },
      (r) {
        enrollmentCheckResult = r;
        emit(IsCourseEnrolledSuccess());
      },
    );
    return Future.value();
  }
}
