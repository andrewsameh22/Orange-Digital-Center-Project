import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../presentation/screens/navbar_screens/nav_home.dart';
import '../presentation/screens/navbar_screens/nav_settings.dart';
import '../presentation/screens/navbar_screens/nav_news.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarInitial());
  static NavbarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  // List<String> screensNames = [
  //   'Home',
  //   'Lsa msh 3aref',
  //   'Settings',
  // ];
  List<Widget> screens = [
    NavHome(),
    NewsScreen(),
    NavSettings(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NavbarTest());
  }
}
