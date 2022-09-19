abstract class QuizEvent {}

class SetSelectedDataEvent extends QuizEvent {
  final String selectedCategory;
  final String selectedDifficulty;

  SetSelectedDataEvent(this.selectedCategory, this.selectedDifficulty);
}

class GetQuizDataEvent extends QuizEvent {}

class CheckCurrentAnswerEvent extends QuizEvent {
  final int currentAnswerIndex;

  CheckCurrentAnswerEvent({required this.currentAnswerIndex});
}

class SetCurrentPageEvent extends QuizEvent {
  final int currentPage;

  SetCurrentPageEvent({required this.currentPage});
}

class SetQuizResultEvent extends QuizEvent {}

class SendDataToFirebaseEvent extends QuizEvent {}

class ClearResutlEvent extends QuizEvent {}
