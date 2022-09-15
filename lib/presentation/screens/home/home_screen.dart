import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import '../../../business_logic/navbar_cubit.dart';
import '../../styles/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavbarCubit(),
        child: BlocConsumer<NavbarCubit, NavbarState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NavbarCubit.get(context);
            return Scaffold(
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: cubit.currentIndex,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  showElevation: false,
                  onItemSelected: (index) {
                    cubit.changeIndex(index);
                  },
                  items: [
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                      ),
                      title: Text('Home'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.calendar,
                      ),
                      title: Text('News'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                      ),
                      title: Text('Settings'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                  ],
                ));
          },
        ));
  }
}
