import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/result/widget/body.dart';
import 'package:quiz_app/shared/shared.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/ResultScreen';

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onButtonPressed() {
      context.read<QuizBloc>().add(ClearResutlEvent());
      Navigator.pushNamed(context, '/');
    }

    return Scaffold(
      appBar: const SharedAppBar(title: 'Result'),
      body: SafeArea(
        child: Container(
          color: kBody,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const Expanded(child: ResultBody()),
              ExpandedButton(onPressed: onButtonPressed, title: "Go to Welcome")
            ],
          ),
        ),
      ),
    );
  }
}
