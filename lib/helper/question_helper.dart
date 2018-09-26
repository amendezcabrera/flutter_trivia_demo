import 'dart:async';
import 'dart:math';
import 'package:trivia_flutter_demo/model/answer.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

final String url = "https://opentdb.com/api.php?amount=1&type=multiple";

Future<Question> retrieveQuestion() async {
  Question question;
  try {
    final response = await http.get(url);
    final jsonResponse = JSON.jsonDecode(response.body);
    Answer correctAnswer = new Answer(
        text: jsonResponse['results'][0]['correct_answer'], correct: true);
    Answer incorrectAnswer1 = new Answer(
        text: jsonResponse['results'][0]['incorrect_answers'][0], correct: false);
    Answer incorrectAnswer2 = new Answer(
        text: jsonResponse['results'][0]['incorrect_answers'][1], correct: false);
    Answer incorrectAnswer3 = new Answer(
        text: jsonResponse['results'][0]['incorrect_answers'][2], correct: false);
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
