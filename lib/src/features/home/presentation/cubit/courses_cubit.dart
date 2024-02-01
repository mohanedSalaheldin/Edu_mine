import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    emit(HomeLayoutNavBarChange());
  }
}
