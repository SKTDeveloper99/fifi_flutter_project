class Question {
  String questionText = "";
  List<Answer>  answersList = [] ;

  Question(this.questionText, this.answersList);

  String getQuestion() {
    return questionText;
  }



  List<Answer> getAnswer() {
    return answersList;
  }
}


class Answer {
  String answerText = "";
  bool isCorrect;

  Answer(this.answerText,this.isCorrect);

  String getAnswer() {
    return answerText;
  }

  bool getCorrect() {
    return isCorrect;
  }
}

