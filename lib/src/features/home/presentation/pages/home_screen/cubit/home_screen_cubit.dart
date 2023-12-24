import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/home/data/models/home_user_data_model.dart';
import 'package:e_learning/src/features/home/domain/entities/home_user_entity.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/features/home/domain/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_monitors_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_courses_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeGetUserDataUsecase getUserDataUsecase;
  final HomeGetUserCoursesUsecase getUserCoursesUsecase;
  final HomeGetMonitorsUsecase getMonitorsUsecase;
  HomeScreenCubit(
      {required this.getUserDataUsecase,
      required this.getMonitorsUsecase,
      required this.getUserCoursesUsecase})
      : super(HomeScreenInitial());

  static HomeScreenCubit get(BuildContext context) => BlocProvider.of(context);
  String userName = '';
  void getUserName({required String uID}) async {
    emit(HomeScreenGetUserDataLoading());
    Either<Failure, HomeUserEntity> response =
        await getUserDataUsecase.call(uID: uID);
    response.fold((failure) {
      emit(HomeScreenGetUserDataError());
    }, (model) {
      userName = model.name;
      emit(HomeScreenGetUserDataSuccess());
    });
  }

  List<CourseEntity> userCourses = [];
  void getUserCourses({required String uID}) async {
    emit(HomeScreenGetUserCoursesLoading());
    Either<Failure, List<CourseEntity>> response =
        await getUserCoursesUsecase.call(uID: uID);
    response.fold((failure) {
      emit(HomeScreenGetUserCoursesError());
    }, (courses) {
      userCourses = courses;
      emit(HomeScreenGetUserCoursesSuccess());
    });
  }

  List<MonitorEntity> monitors = [];
  void getMonitors() async {
    emit(HomeScreenGetMonitorsLoading());
    Either<Failure, List<MonitorEntity>> response =
        await getMonitorsUsecase.call();
    response.fold((failure) {
      emit(HomeScreenGetMonitorsError());
    }, (value) {
      monitors = value;
      emit(HomeScreenGetMonitorsSuccess());
    });
  }
}
