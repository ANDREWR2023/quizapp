import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Question {
  String question;
  List<String> answers;
  int correctAnswerIndex;
  String explanation;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Question> _questions = [
    Question(
      question: 'What is the capital of France?',
      answers: ['New York', 'Paris', 'London', 'Rome', 'Berlin'],
      correctAnswerIndex: 1,
      explanation:
          'Paris is the capital of France, known for its iconic Eiffel Tower.',
    ),
    Question(
      question: 'What is the largest ocean in the world?',
      answers: [
        'Pacific Ocean',
        'Indian Ocean',
        'Atlantic Ocean',
        'Arctic Ocean',
        'Southern Ocean'
      ],
      correctAnswerIndex: 0,
      explanation:
          'The Pacific Ocean is the largest and deepest ocean in the world, covering more than 60 million square miles.',
    ),
    Question(
      question: 'What is the smallest planet in our solar system?',
      answers: ['Venus', 'Mars', 'Mercury', 'Saturn', 'Neptune'],
      correctAnswerIndex: 2,
      explanation:
          'Mercury is the smallest planet in our solar system, with a diameter of just 3,031 miles.',
    ),
    Question(
      question: 'Who invented the telephone?',
      answers: [
        'Thomas Edison',
        'Alexander Graham Bell',
        'Nikola Tesla',
        'Benjamin Franklin',
        'Isaac Newton'
      ],
      correctAnswerIndex: 1,
      explanation:
          'Alexander Graham Bell invented the telephone in 1876, revolutionizing communication as we know it.',
    ),
    Question(
      question: 'What is the largest mammal in the world?',
      answers: ['Elephant', 'Blue Whale', 'Hippopotamus', 'Giraffe', 'Rhino'],
      correctAnswerIndex: 1,
      explanation:
          'The Blue Whale is the largest mammal in the world, with an average length of 80-100 feet and weight of 200 tons.',
    ),
  ];

  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = List.filled(5, null);

  void _selectAnswer(int index) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = index;
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _userAnswers = List.filled(5, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Quiz'),
        ),
        body: (_currentQuestionIndex < _questions.length)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Question ${_currentQuestionIndex + 1}: ${_questions[_currentQuestionIndex].question}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ...List.generate(
                    _questions[_currentQuestionIndex].answers.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () => _selectAnswer(index),
                        child: Text(
                            _questions[_currentQuestionIndex].answers[index]),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Quiz Results:',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  ...List.generate(
                    _questions.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Question ${index + 1}: ${_questions[index].question}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            'Your Answer: ${_questions[index].answers[_userAnswers[index]!]}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Correct Answer: ${_questions[index].answers[_questions[index].correctAnswerIndex]}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Explanation: ${_questions[index].explanation}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _resetQuiz,
                    child: Text('Restart Quiz'),
                  ),
                ],
              ),
      ),
    );
  }
}
