import 'package:flutter/material.dart';
import 'package:q_app/data/questions.dart';
import 'package:q_app/questions_screen.dart';
import 'package:q_app/results_screen.dart';
import 'package:q_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnwer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz(){
        setState(() {
          selectedAnswers = [];
          activeScreen = 'questions-screen';
        });
       }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnwer,
      );
    }
    
     if(activeScreen == 'results-screen'){
      screenWidget =  ResultsScreen(
      chosenAnswers: selectedAnswers,
      onRestart:restartQuiz ,
      );
     }
       
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 119, 24, 228),
                Color.fromARGB(255, 96, 17, 148)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: screenWidget),
      ),
    );
  }
}
