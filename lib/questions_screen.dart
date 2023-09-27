import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';

import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});
  
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); //holding off the widget class inside the state class.

    print('hi');
     return setState(() {
      currentQuestionIndex = currentQuestionIndex + 1 ;
      
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // to stretch the button  and se have also added the container to set the margin to button as
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color:const Color.fromARGB(255, 201, 153, 251),fontSize:24,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
              //applied the spread operator here to spread the list in couple of individual values
            ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(answerText: answer, onTap: (){
                  answerQuestion(answer);
                },);
              },
            ),
          ],
        ),
      ),
    );
  }
}
