import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/shared/shared.dart';
import 'package:quiz_app/welcome/widget/drop_down.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  late String selectedCategory;
  late String selectedDifficulty;

  @override
  void initState() {
    final quizState = BlocProvider.of<QuizBloc>(context).state;
    selectedCategory = quizState.selectedCategory;
    selectedDifficulty = quizState.selectedDifficulty;
    super.initState();
  }

  void setCategory(String? value) {
    setState(() {
      if (value != null) {
        selectedCategory = value;
        context
            .read<QuizBloc>()
            .add(SetSelectedDataEvent(selectedCategory, selectedDifficulty));
      }
    });
  }

  void setDifficulty(String? value) {
    setState(() {
      if (value != null) {
        selectedDifficulty = value;
        context
            .read<QuizBloc>()
            .add(SetSelectedDataEvent(selectedCategory, selectedDifficulty));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                color: kSecondary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropDown(
            list: categories,
            selected: selectedCategory,
            onSelectPress: setCategory,
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Difficulty',
              style: TextStyle(
                fontSize: 16,
                color: kSecondary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropDown(
            list: difficulties,
            selected: selectedDifficulty,
            onSelectPress: setDifficulty,
          ),
        ]));
  }
}
