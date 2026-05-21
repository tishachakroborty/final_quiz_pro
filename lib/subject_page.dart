import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quiz_page.dart';
import 'database_seeder.dart'; // বাটন দেখানোর জন্য

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final List<String> subjects = [
    'Data Structure', 'Computer Networking', 'Operating System', 'DBMS', 
    'Algorithms', 'Compiler Design', 'Software Engineering', 
    'Artificial Intelligence', 'Digital Logic', 'Cyber Security'
  ];

  void startQuiz(String subjectName) async {
    // ফায়ারবেস থেকে ওই সাবজেক্টের সব প্রশ্ন নিয়ে আসা
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Subjects')
        .doc(subjectName)
        .collection('Questions')
        .get();

    List<Map<String, dynamic>> questions = snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    if (questions.isNotEmpty) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(
              subjectName: subjectName,
              questions: questions,
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No questions found! Please click 'Update All Questions' first.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Subject"),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // উপরে আপডেট বাটনটি রাখা হয়েছে
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: DatabaseSeeder(), 
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(subjects[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => startQuiz(subjects[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}