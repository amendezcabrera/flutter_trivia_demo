import 'dart:async';

import 'package:trivia_flutter_demo/helper/question_helper.dart';
import 'package:trivia_flutter_demo/model/question.dart';

class Repository{
  static final Repository _repo = new Repository._internal();

  static Repository get() {
    return _repo;
  }

  Repository._internal();
  
  Future<Question> fetchQuestion(){
    return retrieveQuestion();
  }
}