import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz/widget/answer_container.dart';
import 'package:quiz_app/shared/shared.dart';

class QuestionContainer extends StatelessWidget {
  final QuizModel quiz;
  final Function() onNextPagePressed;
  const QuestionContainer(
      {Key? key, required this.quiz, required this.onNextPagePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> answersMap = quiz.answers.toJson();
    final List<dynamic> answersList = answersMap.values.toList();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            quiz.question,
            style: const TextStyle(
                color: kBasic, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          for (var i = 0; i < answersList.length; i++)
            if (answersList[i] != null)
              AnswerContainer(
                  answer: answersList[i],
                  onPressed: () {
                    context
                        .read<QuizBloc>()
                        .add(CheckCurrentAnswerEvent(currentAnswerIndex: i));
                    onNextPagePressed();
                  })
        ],
      ),
    );
  }
}
