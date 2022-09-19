import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/shared/shared.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Something went wrong...",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: kAccent1,
              ),
        ),
        const SizedBox(height: 60),
        ExpandedButton(
            onPressed: () {
              context.read<QuizBloc>().add(GetQuizDataEvent());
            },
            title: 'Reload'),
        const SizedBox(height: 20),
        ExpandedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            title: 'Go back to Welcome'),
      ],
    );
  }
}
