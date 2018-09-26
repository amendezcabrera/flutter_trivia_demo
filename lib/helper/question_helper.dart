import 'dart:async';
import 'dart:math';
import 'package:trivia_flutter_demo/model/answer.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

const String KEY_RESULTS = "results";
const String KEY_CORRECT_ANSWER = "correct_answer";
const String KEY_INCORRECT_ANSWER = "incorrect_answers";
const String KEY_CATEGORY = "category";
const String KEY_DIFFICULTY = "difficulty";
const String KEY_QUESTION = "question";

final String url = "https://opentdb.com/api.php?amount=1&type=multiple";

Future<Question> retrieveQuestion() async {
  Question question;
  try {
    final response = await http.get(url);
    final jsonResponse = JSON.jsonDecode(response.body);
    Answer correctAnswer = new Answer(
        text: jsonResponse[KEY_RESULTS][0][KEY_CORRECT_ANSWER], correct: true);
    Answer incorrectAnswer1 = new Answer(
        text: jsonResponse[KEY_RESULTS][0][KEY_INCORRECT_ANSWER][0], correct: false);
    Answer incorrectAnswer2 = new Answer(
        text: jsonResponse[KEY_RESULTS][0][KEY_INCORRECT_ANSWER][1], correct: false);
    Answer incorrectAnswer3 = new Answer(
        text: jsonResponse[KEY_RESULTS][0][KEY_INCORRECT_ANSWER][2], correct: false);
    List<Answer> answersList = [
      correctAnswer,
      incorrectAnswer1,
      incorrectAnswer2,
      incorrectAnswer3
    ];
    answersList.shuffle(new Random());
    question =
        Question.fromJson(jsonResponse, answersList);
  } catch (error) {
    return error;
  }
  return question;
}
