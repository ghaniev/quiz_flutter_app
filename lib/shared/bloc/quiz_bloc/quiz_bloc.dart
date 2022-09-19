import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/shared/shared.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.quizRepository}) : super(const QuizState()) {
    on<SetSelectedDataEvent>(_onSetSelectedDataEvent);
    on<GetQuizDataEvent>(_onGetQuizDataEvent);
    on<CheckCurrentAnswerEvent>(_onCheckCurrentAnswerEvent);
    on<SetCurrentPageEvent>(_onSetCurrentPageEvent);
    on<SetQuizResultEvent>(_onSetQuizResultEvent);
    on<ClearResutlEvent>(_onClearResutlEvent);
    on<SendDataToFirebaseEvent>(_onSendDataToFirebaseEvent);
  }
  final QuizRepository quizRepository;

  int numberOfCorrectAnswers = 0;
  int numberOfIncorrectAnswers = 0;

  void _onSetSelectedDataEvent(
      SetSelectedDataEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(
        selectedCategory: event.selectedCategory,
        selectedDifficulty: event.selectedDifficulty));
  }

  FutureOr<void> _onGetQuizDataEvent(
      GetQuizDataEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(isLoading: true, isError: false));
    try {
      final quizList = await quizRepository.getQuizList(
          category: state.selectedCategory,
          difficulty: state.selectedDifficulty);
      emit(
          state.copyWith(quizList: quizList, isLoading: false, isError: false));
    } on Exception catch (e) {
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  void _onSetCurrentPageEvent(
      SetCurrentPageEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(
      currentPage: event.currentPage,
    ));
  }

  void _onCheckCurrentAnswerEvent(
      CheckCurrentAnswerEvent event, Emitter<QuizState> emit) {
    final Map<String, dynamic> correctAnswersMap =
        state.quizList[state.currentPage - 1].correctAnswers.toJson();
    final List<dynamic> correctList = correctAnswersMap.values.toList();

    bool isCorrect = correctList[event.currentAnswerIndex] == 'true';
    if (isCorrect) {
      numberOfCorrectAnswers++;
    } else {
      numberOfIncorrectAnswers++;
    }
  }

  void _onSetQuizResultEvent(
      SetQuizResultEvent event, Emitter<QuizState> emit) {
    DateTime dateNow = DateTime.now();

    final String date =
        '${dateNow.day}.${dateNow.month}.${dateNow.year} ${dateNow.hour}:${dateNow.minute}';

    emit(state.copyWith(
      numberOfCorrectAnswers: numberOfCorrectAnswers,
      numberOfIncorrectAnswers: numberOfIncorrectAnswers,
      date: date,
    ));

    add(SendDataToFirebaseEvent());
  }

  FutureOr<void> _onSendDataToFirebaseEvent(
      SendDataToFirebaseEvent event, Emitter<QuizState> emit) async {
    final result = FirebaseFirestore.instance.collection('quiz_result').doc();

    final data = {
      'id': result.id,
      'category': state.selectedCategory,
      'difficulty': state.selectedDifficulty,
      'date': state.date,
      'correct_answer': state.numberOfCorrectAnswers,
      'incorrect_answer': state.numberOfIncorrectAnswers
    };
    await result.set(data);
  }

  void _onClearResutlEvent(ClearResutlEvent event, Emitter<QuizState> emit) {
    numberOfCorrectAnswers = 0;
    numberOfIncorrectAnswers = 0;
    emit(state.copyWith(
      selectedCategory: 'Linux',
      selectedDifficulty: 'Easy',
      quizList: const [],
      currentPage: 1,
      numberOfCorrectAnswers: 0,
      numberOfIncorrectAnswers: 0,
      date: '',
    ));
  }
}
