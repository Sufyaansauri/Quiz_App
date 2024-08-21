import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
    {super.key});
    final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 250,
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Color.fromARGB(255, 237, 232, 252),
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz, 
           style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
         ),
         icon:const Icon(Icons.arrow_right_alt),
         label:const  Text('Start Quiz'),
         ),
      ],
    ),
    );
  }
}
