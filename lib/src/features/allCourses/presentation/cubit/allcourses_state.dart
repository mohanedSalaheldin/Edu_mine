part of 'allcourses_cubit.dart';

abstract class AllcoursesState extends Equatable {
  const AllcoursesState();

  @override
  List<Object> get props => [];
}

class AllcoursesInitial extends AllcoursesState {}

class GetAllcoursesLoading extends AllcoursesState {}

class GetAllcoursesSuccess extends AllcoursesState {}

class GetAllcoursesError extends AllcoursesState {}

class EnrollInCourseLoading extends AllcoursesState {}

class EnrollInCourseSuccess extends AllcoursesState {}

class EnrollInCourseError extends AllcoursesState {}

class IsCourseEnrolledLoading extends AllcoursesState {}

class IsCourseEnrolledSuccess extends AllcoursesState {}

class IsCourseEnrolledError extends AllcoursesState {}
