import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_flutter/business_logic/login_cubit.dart';
import 'package:odc_flutter/business_logic/news_cubit.dart';
import 'package:odc_flutter/presentation/screens/home/home_screen.dart';
import 'package:odc_flutter/presentation/screens/navbar_screens/nav_settings.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';

import 'business_logic/faq/faq_cubit.dart';
import 'business_logic/notes_cubit.dart';
import 'business_logic/signup/signup_cubit.dart';
import 'database/database/local/cache_helper.dart';
import 'database/database/network/dio_helper.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NotesCubit()),
          BlocProvider(create: (context) => NewsCubit()),
          BlocProvider(create: (context) => SignupCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => FaqCubit()..getFAQ()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: primaryColor,
              ),
            ),
          ),
          home: SplashScreen(),
        ));
  }
}
