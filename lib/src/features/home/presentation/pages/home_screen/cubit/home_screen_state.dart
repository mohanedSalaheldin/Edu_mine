part of 'home_screen_cubit.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenGetUserDataError extends HomeScreenState {
  final String msg;

  const HomeScreenGetUserDataError({required this.msg});
}

final class HomeScreenGetUserDataSuccess extends HomeScreenState {}

final class HomeScreenGetUserDataLoading extends HomeScreenState {}

final class HomeScreenGetUserCoursesError extends HomeScreenState {
  final String msg;

  const HomeScreenGetUserCoursesError({required this.msg});
}

final class HomeScreenGetUserCoursesSuccess extends HomeScreenState {}

final class HomeScreenGetUserCoursesLoading extends HomeScreenState {}

final class HomeScreenGetMonitorsError extends HomeScreenState {
  final String msg;
  const HomeScreenGetMonitorsError({required this.msg});
}

final class HomeScreenGetMonitorsSuccess extends HomeScreenState {}

final class HomeScreenGetMonitorsLoading extends HomeScreenState {}
