import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/core/di/injection_container.dart';
import 'package:suitmedia/presentation/bloc/palindrome/palindrome_bloc.dart';
import 'package:suitmedia/presentation/bloc/user/user_bloc.dart';
import 'package:suitmedia/presentation/pages/first_page.dart';
import 'package:suitmedia/presentation/pages/third_page.dart';

void main() async {
  await initDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var random = Random();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injection<UserBloc>()
            ..add(UserEventGetAll(
                page: random.nextInt(2) + 1, perPage: random.nextInt(10) + 1)),
        ),
        BlocProvider(create: (context) => injection<PalindromeBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suitmedia',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: FirstPage(),
      ),
    );
  }
}
