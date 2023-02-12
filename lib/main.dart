import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:one_digital_home_assigment/bloc/favorites/favorites_bloc.dart';
import 'package:one_digital_home_assigment/bloc/user/user_bloc.dart';
import 'package:one_digital_home_assigment/views/home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()..add(LoadUser())),
        BlocProvider(create: (context) => FavoritesBloc()..add(LoadFavorites()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'One Digital Home Assigment',
        home: HomeScreen(),
      ),
    );
  }
}
