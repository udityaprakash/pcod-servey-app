import 'package:flutter/material.dart';
import 'package:pcos_survey_app/main.dart';
import 'package:pcos_survey_app/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Map<int, Map<String, dynamic>> _sections = questionTemplate;
  int _currentSectionIndex = 0;
  Map<int, String?> _selectedAnswers = {};

  void _nextSection() {
    if (_currentSectionIndex < _sections.length - 1) {
      setState(() {
        _currentSectionIndex++;
        _selectedAnswers = {};
      });
    } else {
      Navigator.pushReplacementNamed(context, '/thankyou');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSection = _sections[_currentSectionIndex]!;
    final questions =
        currentSection['questions'] as Map<int, Map<String, dynamic>>;

    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(currentSection['sectionName']+" Section"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView.builder(
                    itemCount:
                        (questions.length / (isWideScreen ? 2 : 1)).ceil(),
                    itemBuilder: (context, index) {
                      int firstQuestionIndex = index * (isWideScreen ? 2 : 1);
                      List<Widget> rowChildren = [];

                      for (int i = 0; i < (isWideScreen ? 2 : 1); i++) {
                        if (firstQuestionIndex + i < questions.length) {
                          rowChildren.add(
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10),
                                child: QuestionCard(
                                  questionData:
                                      questions[firstQuestionIndex + i]!,
                                  isSelected:
                                      _selectedAnswers[firstQuestionIndex + i],
                                  onSelected: (answer) {
                                    setState(() {
                                      _selectedAnswers[firstQuestionIndex + i] =
                                          answer;
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                      }

                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...rowChildren,
                            if (isWideScreen && rowChildren.length == 1)
                              const Expanded(child: SizedBox()),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: isWideScreen ? CrossAxisAlignment.end : CrossAxisAlignment.stretch,
                children: [
                  CustomButton(text: _currentSectionIndex == _sections.length - 1
                          ? 'Finish'
                          : 'Next Section', onPressed:  _selectedAnswers.length == questions.length
                          ? _nextSection
                          : null,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final Map<String, dynamic> questionData;
  final String? isSelected;
  final ValueChanged<String> onSelected;

  const QuestionCard({
    required this.questionData,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionData['question'] as String,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...(questionData['options'] as List<String>).map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: isSelected,
                onChanged: (value) {
                  if (value != null) {
                    onSelected(value);
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
