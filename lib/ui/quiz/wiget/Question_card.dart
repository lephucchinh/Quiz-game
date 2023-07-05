import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtest/constants.dart';

import '../../../app/bloc/app_bloc.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({Key? key, required this.quizItem}) : super(key: key);

  final Map<String, dynamic> quizItem;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool click = false;
  late int chooseAnsew;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: kBlackColor,
        ),
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        children: [
          Container(
            height: kDefaultPadding * 3,
            child: Text(
              widget.quizItem["question"],
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: widget.quizItem['options'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 3),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (click == false) {
                            click = true;
                            chooseAnsew = index;
                            if (chooseAnsew ==
                                widget.quizItem["answer_index"]) {
                              context.read<AppBloc>().add(SumAnsewr());
                              context.read<AppBloc>().add(CheckAnsewrTrue());
                            }
                            if (chooseAnsew !=
                                widget.quizItem["answer_index"]) {
                              context.read<AppBloc>().add(CheckAnsewrFalse());
                            }
                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: click
                                    ? ((index == chooseAnsew)
                                        ? (state.check
                                            ? Colors.green
                                            : Colors.red)
                                        : kBlackColor)
                                    : kBlackColor),
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.quizItem['options'][index],
                                style: TextStyle(
                                  color: click
                                      ? ((index == chooseAnsew)
                                          ? (state.check
                                              ? Colors.green
                                              : Colors.red)
                                          : kBlackColor)
                                      : kBlackColor,
                                ),
                              ),
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: click
                                          ? ((index == chooseAnsew)
                                              ? (state.check
                                                  ? Colors.green
                                                  : Colors.red)
                                              : kBlackColor)
                                          : kBlackColor),
                                ),
                                child: (click == true && index == chooseAnsew)
                                    ? (state.check
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green)
                                        : Icon(Icons.cancel, color: Colors.red))
                                    : SizedBox(),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
