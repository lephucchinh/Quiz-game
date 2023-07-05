import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtest/ui/quiz/body.dart';

import '../../app/bloc/app_bloc.dart';
import 'wiget/score_Screen.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<AppBloc>().add(ResetTimer());
                  dispose();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new));
          },
        ),
        actions: [
          TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => scoreScreen()));
                },
                child: Text(
                  "End",
                  style: TextStyle(color: Colors.white),
                ),
              )

        ],
      ),
      body: Body(),
    );
  }

}

