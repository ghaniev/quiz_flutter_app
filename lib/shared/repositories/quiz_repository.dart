import 'dart:async';

import 'package:quiz_app/shared/shared.dart';

class QuizRepository {
  const QuizRepository({
    required this.quizApiClient,
  });

  final QuizApiClient quizApiClient;

  Future<List<QuizModel>> getQuizList(
      {required String category, required String difficulty}) async {
    final getQuizList = await quizApiClient.getQuizList(
        category: category, difficulty: difficulty);

    return getQuizList;
  }
}
