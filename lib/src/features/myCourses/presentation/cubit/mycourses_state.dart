part of 'mycourses_cubit.dart';

abstract class MycoursesState extends Equatable {
  const MycoursesState();

  @override
  List<Object> get props => [];
}

class MycoursesInitial extends MycoursesState {}

class MycoursesGetMyCoursesLoading extends MycoursesState {}

class MycoursesGetMyCoursesSuccess extends MycoursesState {}

class MycoursesGetMyCoursesError extends MycoursesState {}

class GetAllSectionsLoading extends MycoursesState {}

class GetAllSectionsSuccess extends MycoursesState {}

class GetAllSectionsError extends MycoursesState {}
