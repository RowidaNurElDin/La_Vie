import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Cubit/lavie_cubit.dart';
import 'package:la_vie/Cubit/lavie_states.dart';
import 'package:la_vie/Models/exam_model.dart';
import 'package:la_vie/main.dart';

import '../../Components.dart';
import 'home_screen.dart';

class CourseExam extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, LaVieStates>(
        listener: (context, states){},
        builder: (context , states){
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text("Course Exam",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Components.questionTile(
                      QuestionCubit.get(context).questionsList[QuestionCubit.get(context).quesCounter],
                      QuestionCubit.get(context).quesCounter+1,
                      QuestionCubit.get(context).questionsList.length
                  ),
                  SizedBox(height: 50,),
                  Flexible(
                    child: Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Components.answerTile(context,
                              QuestionCubit.get(context).questionsList[QuestionCubit.get(context).quesCounter].answers,
                              false,  //TO BE HANDLED
                              index ,
                          ),
                          separatorBuilder: (context, index) => Container(),
                          itemCount: QuestionCubit.get(context).quesAnswers.length),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuestionCubit.get(context).quesCounter == 0 ? Container(width: 180,) :
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Container(width:150,
                          child: Container(
                            child: ElevatedButton(
                                onPressed: (){
                                  QuestionCubit.get(context).decQuesCounter();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Poppins"
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.green[500]!)),
                                    ))),
                          ),) ,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Container(width:150,child:
                        Components.myButton(
                            QuestionCubit.get(context).quesCounter+1 ==QuestionCubit.get(context).questionsList.length ? "Finish" : "Next",
                                (){
                              if(QuestionCubit.get(context).quesCounter+1 ==QuestionCubit.get(context).questionsList.length){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (BuildContext context) => MobileHome()));
                              }
                              else{
                                QuestionCubit.get(context).incQuesCounter();
                              }
                        })) ,
                      ),


                    ],
                  )

                ],
              ),
            ),
          );

        }
    );
  }
}
