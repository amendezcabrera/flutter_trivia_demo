import 'package:flutter/material.dart';
import 'package:trivia_flutter_demo/model/question.dart';
import 'package:trivia_flutter_demo/repository.dart';
import 'package:trivia_flutter_demo/widget/amswers_container.dart';
import 'package:trivia_flutter_demo/widget/question_container.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Open Trivia',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Open Trivia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      body: _newQuestion(),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          setState(() {
            _newQuestion();
          });
        },
        tooltip: 'Next question',
        child: new Icon(
          Icons.skip_next,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _newQuestion() {
    return FutureBuilder(
        future: Repository.get().fetchQuestion(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return _getLoadingWidget();
            case ConnectionState.done:
              return _getMainWidget(snapshot.data);
          }
        });
  }

  Widget _getMainWidget(question) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              question.category,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  QuestionContainer(question: question.question),
                ],
              ),
            ),
            AnswersContainer(
              question: question,
              onQuestionAnswered: () {
                setState(() {
                  _newQuestion();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLoadingWidget() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                'Loading',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
