import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz/view/quiz_screen.dart';
import 'package:quiz_app/result/view/result_screen.dart';
import 'package:quiz_app/shared/shared.dart';
import 'package:quiz_app/welcome/view/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final quizRepository =
      QuizRepository(quizApiClient: QuizApiClient(httpClient: http.Client()));

  runApp(QuizApp(quizRepository: quizRepository));
}

class QuizApp extends StatelessWidget {
  final QuizRepository quizRepository;
  const QuizApp({Key? key, required this.quizRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc(quizRepository: quizRepository),
      child: MaterialApp(
        title: 'Quiz',
        theme: ThemeData.light(),
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ResultScreen.routeName:
              return CupertinoPageRoute(
                  builder: (BuildContext context) => const ResultScreen());
            case QuizScreen.routeName:
              return CupertinoPageRoute(
                  builder: (BuildContext context) => const QuizScreen());
          }
          return null;
        },
      ),
    );
  }
}
