import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz/widget/quiz_body.dart';
import 'package:quiz_app/shared/shared.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/QuizScreen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizState = context.watch<QuizBloc>().state;
    return Scaffold(
      appBar: const SharedAppBar(title: 'Quiz'),
      body: SafeArea(
        child: Container(
            color: kBody,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: quizState.isLoading
                ? const Loader()
                : quizState.isError
                    ? const ExceptionWidget()
                    : QuizBody(quizList: quizState.quizList)),
      ),
    );
  }
}
