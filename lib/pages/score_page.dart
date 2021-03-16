import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import '../pages/landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.blueAccent,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Your Score is :",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Text(
              score.toString() + "/" + totalQuestions.toString(),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            new IconButton(
              icon: new Icon(Icons.arrow_forward),
              iconSize: 80.0,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LandingPage()),
                    (Route route) => route == null);
                return;
              },
            )
          ],
        ),
      ),
    );
  }
}
