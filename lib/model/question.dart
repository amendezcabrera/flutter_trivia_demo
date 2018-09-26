import 'dart:math';

import 'package:meta/meta.dart';
import 'package:trivia_flutter_demo/helper/question_helper.dart';
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
      : question = json[KEY_RESULTS][0][KEY_QUESTION],
        category = json[KEY_RESULTS][0][KEY_CATEGORY],
        difficulty = json[KEY_RESULTS][0][KEY_DIFFICULTY],
        this.answersList = answersList;

  @override
  String toString() {
    return 'Question{category: $category, difficulty: $difficulty\n\tquestion: $question\n\tanswers: $answersList}';
  }
}
