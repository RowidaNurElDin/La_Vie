import 'package:flutter/material.dart';

class CourseModel{

  String question;
  List<Answer> answers;
  int correctAns ;

  CourseModel(this.question, this.answers, this.correctAns);

}

class Answer{
  String? answer;
  bool? isSelected;

  Answer(this.answer, this.isSelected);


}