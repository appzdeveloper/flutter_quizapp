import './questions.dart';

class Quiz {
  List<Questions> _questions;

  int _currQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  int get score => _score;
  int get questionLength => _questions.length;
  int get questionNumber => _currQuestionIndex + 1;
  List<Questions> get questions => _questions;

  Questions get nextQuestion{
    _currQuestionIndex++;
    if (_currQuestionIndex >= questionLength) return null;
    return _questions[_currQuestionIndex];
  }

  void answer(bool answer) {
    if(answer) _score++;
  }
}