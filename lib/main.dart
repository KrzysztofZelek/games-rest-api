import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_rest_api/bloc/game_bloc.dart';
import 'package:games_rest_api/repository/game_repo.dart';
import 'package:games_rest_api/screens/landing_page.dart';

void main() {
  runApp(BlocProvider<GameBloc>(
    create: (context) => GameBloc(GameRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Games App',
      home: LandingPage(),
    );
  }
}
