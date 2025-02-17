import 'package:banka/presentation/cities/cubit/cities_cubit.dart';
import 'package:banka/presentation/login/login_screen.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CitiesCubit>(
          lazy: false,
          create: (BuildContext context) => CitiesCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bnka',
      theme: AppTheme.instance.theme(),
      home: LoginScreen(),
    );
  }
}
