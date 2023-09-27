// here we have a done a work to lift a state up here start screen and questions screen depends upon the same state and we have lifted the stateup in the quizapp.

import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen; // this means activeScreen can also be null.
  var activeScreen = 'start-screen';

  // ignore: override_on_non_overriding_member
  // @override

  // // here  have added init state because initialization and questio screen was running simultaneously so to avoid that i have done this.
  // void initState() {
  //   // storing a widget here in a variable. and here we have also set to widget type instead of var because the class we defines flutter sets those classes a type. so to remove the error we have done set the type to widget.
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen =
          'questions-screen'; // here the screens are conditionally rendered bacause in start it well render the startscreen and if some change happens it will render the Questionsscreen.
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    print("question  screen pe hai");

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
        print("home screen pe gaya");
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      )),
    );
  }
}
