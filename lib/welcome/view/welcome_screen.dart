import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz/view/quiz_screen.dart';
import 'package:quiz_app/shared/shared.dart';
import 'package:quiz_app/welcome/widget/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: 'Welcome'),
      body: SafeArea(
        child: Container(
          color: kBody,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeBody(),
              ExpandedButton(
                  onPressed: () {
                    context.read<QuizBloc>().add(GetQuizDataEvent());
                    Navigator.pushNamed(context, QuizScreen.routeName);
                  },
                  title: 'Go to Quiz')
            ],
          ),
        ),
      ),
    );
  }
}
