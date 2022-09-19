import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz/widget/question_container.dart';
import 'package:quiz_app/result/view/result_screen.dart';
import 'package:quiz_app/shared/shared.dart';

class QuizBody extends StatefulWidget {
  final List<QuizModel> quizList;
  const QuizBody({Key? key, required this.quizList}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  void nextPage(int currentPage) {
    if (currentPage != widget.quizList.length) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      context.read<QuizBloc>().add(SetQuizResultEvent());
      Navigator.pushNamed(context, ResultScreen.routeName);
    }
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<QuizBloc>().state.currentPage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Question $currentPage/10',
          style: const TextStyle(
              color: kBasic, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 2),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: widget.quizList.length,
            onPageChanged: (value) => {
              context
                  .read<QuizBloc>()
                  .add(SetCurrentPageEvent(currentPage: value + 1)),
            },
            itemBuilder: (context, index) => QuestionContainer(
                quiz: widget.quizList[index],
                onNextPagePressed: () => nextPage(currentPage)),
          ),
        ),
      ],
    );
  }
}
