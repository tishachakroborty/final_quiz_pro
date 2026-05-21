import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String subjectName;
  final List<dynamic> questions;

  const QuizPage({super.key, required this.subjectName, required this.questions});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // উত্তর জমা রাখার জন্য Map
  Map<int, int> selectedAnswers = {};

  void showResult() {
    int score = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (selectedAnswers[i] == widget.questions[i]['correctIndex']) {
        score++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Result", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text("You scored $score out of ${widget.questions.length}", 
          style: const TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dialog বন্ধ করা
              Navigator.pop(context); // Subject Page এ ফিরে যাওয়া
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subjectName)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.questions.length,
              itemBuilder: (context, qIndex) {
                var q = widget.questions[qIndex];
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Q: ${q['question']}", 
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        // অপশনগুলো সহজভাবে সাজানো
                        ...List.generate(q['options'].length, (oIndex) {
                          return RadioListTile<int>(
                            title: Text(q['options'][oIndex]),
                            value: oIndex,
                            groupValue: selectedAnswers[qIndex],
                            onChanged: (value) {
                              setState(() {
                                selectedAnswers[qIndex] = value!;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // সাবমিট বাটনটি এখন স্ক্রিনের নিচে ফিক্সড থাকবে
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: selectedAnswers.length == widget.questions.length 
                ? showResult 
                : null, // সব উত্তর না দিলে বাটন কাজ করবে না
              child: Text(
                selectedAnswers.length == widget.questions.length 
                ? "See My Result" 
                : "Answer all questions (${selectedAnswers.length}/${widget.questions.length})",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}