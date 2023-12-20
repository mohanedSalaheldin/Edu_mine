import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'allcourses_state.dart';

class AllcoursesCubit extends Cubit<AllcoursesState> {
  AllcoursesCubit() : super(AllcoursesInitial());
}
