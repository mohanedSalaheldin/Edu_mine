import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mycourses_state.dart';

class MycoursesCubit extends Cubit<MycoursesState> {
  MycoursesCubit() : super(MycoursesInitial());
}
