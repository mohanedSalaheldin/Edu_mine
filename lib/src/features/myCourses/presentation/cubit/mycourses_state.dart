part of 'mycourses_cubit.dart';

abstract class MycoursesState extends Equatable {
  const MycoursesState();

  @override
  List<Object> get props => [];
}

class MycoursesInitial extends MycoursesState {}

class MycoursesGetMyCoursesLoading extends MycoursesState {}

class MycoursesGetMyCoursesSuccess extends MycoursesState {}

class MycoursesGetMyCoursesError extends MycoursesState {
  final String msg;

 const MycoursesGetMyCoursesError({required this.msg});
}

class GetAllSectionsLoading extends MycoursesState {}

class GetAllSectionsSuccess extends MycoursesState {}

class GetAllSectionsError extends MycoursesState {
  final String msg;

 const GetAllSectionsError({required this.msg});
}

class ChangeCurrentSection extends MycoursesState {}

class SetSectionAsWatchedSuccess extends MycoursesState {}

class SetSectionAsWatchedError extends MycoursesState {
  final String msg;

 const SetSectionAsWatchedError({required this.msg});
}

class SetSectionAsWatchedLoading extends MycoursesState {}

class CurrentSectionIsEndedState extends MycoursesState {}
