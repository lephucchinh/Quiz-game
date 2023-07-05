import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtest/ui/home_page.dart';

import 'bloc/app_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
