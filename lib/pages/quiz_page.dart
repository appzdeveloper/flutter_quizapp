import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

import '../pages/score_page.dart';

import '../Custom_Widgets/answer_buttons.dart';
import '../Custom_Widgets/question_Widget.dart';
import '../Custom_Widgets/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizState();
}

class QuizState extends State<QuizPage> {
  Questions questions;
  Quiz quiz = new Quiz([
    new Questions("I am Robot", false),
    new Questions("I am not Robot", true),
    new Questions("You are Robot", false),
    new Questions("You are not Robot", true),
    new Questions("We are not Robot", true),
    new Questions("We are Robot", false),
  ]);

  String questionText;
  bool isCorrect;
  int questionNumber;
  bool overlayVisible = false;
  @override
  void initState() {
    super.initState();
    questions = quiz.nextQuestion;
    questionText = questions.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (answer == questions.answer);
    quiz.answer(isCorrect);
    this.setState(() {
      this.overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new AnswerButton(false, () {
              handleAnswer(false);
            }),
            new QuestionWidget(questionText, questionNumber),
            new AnswerButton(true, () {
              handleAnswer(true);
            }),
          ],
        ),
        overlayVisible == true
            ? new CorrectWrongOverlay(isCorrect, () {
                questions = quiz.nextQuestion;
                if (questions == null) {
                  print("No more questions.");
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ScorePage(quiz.score, quiz.questionLength)),(Route route) => route == null);
                  return;
                } else {
                  this.setState(() {
                    overlayVisible = false;
                    questionText = questions.question;
                    questionNumber = quiz.questionNumber;
                  });
                }
              })
            : new Container(),
      ],
    );
  }
}
