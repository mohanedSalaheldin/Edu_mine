part of 'home_screen_cubit.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenGetUserDataError extends HomeScreenState {}

final class HomeScreenGetUserDataSuccess extends HomeScreenState {}

final class HomeScreenGetUserDataLoading extends HomeScreenState {}

final class HomeScreenGetUserCoursesError extends HomeScreenState {}

final class HomeScreenGetUserCoursesSuccess extends HomeScreenState {}

final class HomeScreenGetUserCoursesLoading extends HomeScreenState {}
final class HomeScreenGetMonitorsError extends HomeScreenState {}

final class HomeScreenGetMonitorsSuccess extends HomeScreenState {}

final class HomeScreenGetMonitorsLoading extends HomeScreenState {}
