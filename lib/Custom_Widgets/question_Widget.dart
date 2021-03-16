import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

class QuestionWidget extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  @override
  State createState() => new QuestionState();
  QuestionWidget(this._question, this._questionNumber);
}

class QuestionState extends State<QuestionWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 800), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.easeOut);
    _fontSizeAnimation.addListener(() => this.setState(() => {}));
    _fontSizeAnimationController.forward();
  }

@override
void dispose() {
    // TODO: implement dispose
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

@override
  void didUpdateWidget(QuestionWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Material(
              color: Colors.white,
              child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 10.0),
                child: new Center(
                  child: new Text(
                    "Statement " +
                        widget._questionNumber.toString() +
                        " : " +
                        widget._question,
                    style: new TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: _fontSizeAnimation.value * 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
