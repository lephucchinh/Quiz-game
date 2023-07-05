import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtest/constants.dart';
import 'package:newtest/ui/quiz/Quiz_Screen.dart';

import '../app/bloc/app_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/bg.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      "Let's Play Quiz,",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Enter your informations below",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Spacer(),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    Spacer(),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<AppBloc>().add(ResetAnsewr());
                            context.read<AppBloc>().add(StartTimer());
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => QuizScreen()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(kDefaultPadding * 0.75),
                            decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12))),
                            child: Text(
                              "Let Start Quiz",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                    Spacer(flex: 2,),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

