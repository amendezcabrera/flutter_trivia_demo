import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String question;

  QuestionContainer({@required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            maxLines: 4,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
