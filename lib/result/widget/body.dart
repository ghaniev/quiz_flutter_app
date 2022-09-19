import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/result/widget/result_container.dart';
import 'package:quiz_app/shared/shared.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizState = context.watch<QuizBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultContainer(
            title: "Date",
            color: kBasic,
            result: quizState.date,
          ),
          const SizedBox(height: 20),
          ResultContainer(
            title: "Correct answer",
            color: kAccent2,
            result: quizState.numberOfCorrectAnswers.toString(),
          ),
          const SizedBox(height: 20),
          ResultContainer(
            title: "Incorrect answer",
            color: kAccent1,
            result: quizState.numberOfIncorrectAnswers.toString(),
          ),
          const SizedBox(height: 20),
          ResultContainer(
            title: "Category",
            color: kBasic,
            result: quizState.selectedCategory,
          ),
          const SizedBox(height: 20),
          ResultContainer(
            title: "Difficulty",
            color: kBasic,
            result: quizState.selectedDifficulty,
          ),
        ],
      ),
    );
  }
}
