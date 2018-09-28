import 'package:flutter/material.dart';

class IncorrectAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.redAccent),
      child: Center(
        child: SizedBox(
          height: 600.0,
          width: double.maxFinite,
          child: SimpleDialog(
            children: <Widget>[
              Icon(
                Icons.close,
                size: 150.0,
                color: Colors.redAccent,
              ),
              Text(
                'Wronnggg!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
