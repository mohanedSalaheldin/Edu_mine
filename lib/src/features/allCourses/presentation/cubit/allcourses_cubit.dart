import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'allcourses_state.dart';

class AllcoursesCubit extends Cubit<AllcoursesState> {
  AllcoursesCubit() : super(AllcoursesInitial());
}
