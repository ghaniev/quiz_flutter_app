import 'package:quiz_app/shared/shared.dart';

class QuizState {
  const QuizState({
    this.isLoading = false,
    this.isError = false,
    this.selectedCategory = 'Linux',
    this.selectedDifficulty = 'Easy',
    this.quizList = const [],
    this.currentPage = 1,
    this.numberOfCorrectAnswers = 0,
    this.numberOfIncorrectAnswers = 0,
    this.date = '',
  });

  final bool isLoading, isError;
  final String selectedCategory, selectedDifficulty;
  final List<QuizModel> quizList;
  final int currentPage, numberOfCorrectAnswers, numberOfIncorrectAnswers;
  final String date;

  QuizState copyWith({
    bool? isLoading,
    bool? isError,
    String? selectedCategory,
    String? selectedDifficulty,
    List<QuizModel>? quizList,
    int? currentPage,
    int? numberOfCorrectAnswers,
    int? numberOfIncorrectAnswers,
    String? date,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedDifficulty: selectedDifficulty ?? this.selectedDifficulty,
      quizList: quizList ?? this.quizList,
      currentPage: currentPage ?? this.currentPage,
      numberOfIncorrectAnswers:
          numberOfIncorrectAnswers ?? this.numberOfIncorrectAnswers,
      numberOfCorrectAnswers:
          numberOfCorrectAnswers ?? this.numberOfCorrectAnswers,
      date: date ?? this.date,
    );
  }
}
