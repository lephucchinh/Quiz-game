import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtest/constants.dart';
import 'package:newtest/ui/quiz/wiget/Question_card.dart';
import 'package:newtest/ui/quiz/wiget/score_Screen.dart';

import '../../app/bloc/app_bloc.dart';
import '../../models/Questions.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;
  int end = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {


        return Stack(
          children: [
            SvgPicture.asset(
              'assets/images/bg.svg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3F4768), width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                            builder: (context, constrants) {
                          end = (state.time / 100).round();
                          if (end == 5) {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(builder: (context) => scoreScreen()),
                              );
                            });

                          }
                          return Container(
                            width: constrants.maxWidth * (state.time / 6000),
                            decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          );

                        }),
                        Positioned.fill(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${(state.time / 100).round()} Sec"),
                              SvgPicture.asset(
                                'assets/images/clock.svg',
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Question ${currentPage + 1}',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w100,
                          color: kGrayColor,
                        ),
                        children: [
                          TextSpan(
                              text: '/${sample_data.length}',
                              style: TextStyle(
                                fontSize: 25,
                                color: kGrayColor,
                              )),
                        ]),
                  ),
                  Divider(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Expanded(
                    child: PageView.builder(
                      itemCount: sample_data.length,
                      itemBuilder: (context, index) =>
                          QuestionCard(quizItem: sample_data[index]),
                      onPageChanged: (index) {
                        setState(() {
                          if (currentPage <= index) {
                            currentPage = index;
                          }
                          _pageController.animateToPage(
                            currentPage,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        });
                      },
                      controller: _pageController,
                    ),
                  ),
                ],
              ),
            )),
          ],
        );
      },
    );
  }
}
