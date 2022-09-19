import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/shared/shared.dart';

const API_KEY = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

class QuizApiClient {
  QuizApiClient({required this.httpClient});

  final http.Client httpClient;

  Future<List<QuizModel>> getQuizList(
      {required String category, required String difficulty}) async {
    try {
      var params = {
        'apiKey': API_KEY,
        'difficulty': difficulty,
        'category': category,
        'limit': 10,
      };
      var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

      var url = Uri.parse('https://quizapi.io/api/v1/questions?$query');
      var response = await http.get(url);
      Iterable l = json.decode(response.body);
      List<QuizModel> quizList =
          List<QuizModel>.from(l.map((model) => QuizModel.fromJson(model)));

      return quizList;
    } catch (e) {
      throw Exception('http.get error');
    }
  }
}
