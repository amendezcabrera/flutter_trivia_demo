import 'dart:math';

import 'package:meta/meta.dart';
import 'package:trivia_flutter_demo/model/answer.dart';

class Question {
  String category;
  String difficulty;
  String question;
  List<Answer> answersList;

  Question(
      {@required this.question,
      @required this.category,
      @required this.difficulty,
      @required this.answersList});

  Question.fromJson(Map<String, dynamic> json, List<Answer> answersList)
      : question = json['results'][0]['question'],
        category = json['results'][0]['category'],
        difficulty = json['results'][0]['difficulty'],
        this.answersList = answersList;

  @override
  String toString() {
    return 'Question{category: $category, difficulty: $difficulty, question: $question, Answers: $answersList}';
  }
}
