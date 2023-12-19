import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mycourses_state.dart';

class MycoursesCubit extends Cubit<MycoursesState> {
  MycoursesCubit() : super(MycoursesInitial());
}
