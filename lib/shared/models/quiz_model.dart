class QuizModel {
  QuizModel({
    required this.id,
    required this.question,
    required this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    required this.explanation,
    required this.category,
    required this.difficulty,
  });
  late final int id;
  late final String question;
  late final String? description;
  late final Answers answers;
  late final String multipleCorrectAnswers;
  late final CorrectAnswers correctAnswers;
  late final String? explanation;
  late final String category;
  late final String difficulty;

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    description = json['description'];
    answers = Answers.fromJson(json['answers']);
    multipleCorrectAnswers = json['multiple_correct_answers'];
    correctAnswers = CorrectAnswers.fromJson(json['correct_answers']);
    explanation = json['explanation'];
    category = json['category'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['description'] = description;
    _data['answers'] = answers.toJson();
    _data['multiple_correct_answers'] = multipleCorrectAnswers;
    _data['correct_answers'] = correctAnswers.toJson();
    _data['explanation'] = explanation;
    _data['category'] = category;
    _data['difficulty'] = difficulty;
    return _data;
  }
}

class Answers {
  Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    this.answerE,
    this.answerF,
  });
  late final String answerA;
  late final String answerB;
  late final String answerC;
  late final String answerD;
  late final String? answerE;
  late final String? answerF;

  Answers.fromJson(Map<String, dynamic> json) {
    answerA = json['answer_a'];
    answerB = json['answer_b'];
    answerC = json['answer_c'];
    answerD = json['answer_d'];
    answerE = json['answer_e'];
    answerF = json['answer_f'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['answer_a'] = answerA;
    _data['answer_b'] = answerB;
    _data['answer_c'] = answerC;
    _data['answer_d'] = answerD;
    _data['answer_e'] = answerE;
    _data['answer_f'] = answerF;
    return _data;
  }
}

class CorrectAnswers {
  CorrectAnswers({
    required this.answerACorrect,
    required this.answerBCorrect,
    required this.answerCCorrect,
    required this.answerDCorrect,
    required this.answerECorrect,
    required this.answerFCorrect,
  });
  late final String answerACorrect;
  late final String answerBCorrect;
  late final String answerCCorrect;
  late final String answerDCorrect;
  late final String answerECorrect;
  late final String answerFCorrect;

  CorrectAnswers.fromJson(Map<String, dynamic> json) {
    answerACorrect = json['answer_a_correct'];
    answerBCorrect = json['answer_b_correct'];
    answerCCorrect = json['answer_c_correct'];
    answerDCorrect = json['answer_d_correct'];
    answerECorrect = json['answer_e_correct'];
    answerFCorrect = json['answer_f_correct'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, String>{};
    _data['answer_a_correct'] = answerACorrect;
    _data['answer_b_correct'] = answerBCorrect;
    _data['answer_c_correct'] = answerCCorrect;
    _data['answer_d_correct'] = answerDCorrect;
    _data['answer_e_correct'] = answerECorrect;
    _data['answer_f_correct'] = answerFCorrect;
    return _data;
  }
}
