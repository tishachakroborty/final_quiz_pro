import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseSeeder extends StatelessWidget {
  const DatabaseSeeder({super.key});

  static Future<void> uploadQuestions(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;
    
    // ১০টি সাবজেক্ট এবং ৫০টি প্রশ্ন (correctIndex সহ)
    Map<String, List<Map<String, dynamic>>> allData = {
      'Data Structure': [
        {'question': 'Which data structure uses LIFO?', 'options': ['Stack', 'Queue', 'Array', 'Tree'], 'correctIndex': 0},
        {'question': 'Non-linear data structure is?', 'options': ['Stack', 'Queue', 'Tree', 'Array'], 'correctIndex': 2},
        {'question': 'Insertion in Queue happens at?', 'options': ['Front', 'Rear', 'Top', 'Center'], 'correctIndex': 1},
        {'question': 'Used for BFS traversal?', 'options': ['Stack', 'Queue', 'Tree', 'Graph'], 'correctIndex': 1},
        {'question': 'Binary search complexity?', 'options': ['O(n)', 'O(n^2)', 'O(log n)', 'O(1)'], 'correctIndex': 2},
      ],
      'Computer Networking': [
        {'question': 'OSI model layers?', 'options': ['5', '6', '7', '8'], 'correctIndex': 2},
        {'question': 'IP stands for?', 'options': ['Internet Protocol', 'Internal Post', 'Intra Post', 'Info Point'], 'correctIndex': 0},
        {'question': 'Routing happens at which layer?', 'options': ['Physical', 'Data Link', 'Network', 'Transport'], 'correctIndex': 2},
        {'question': 'HTTP port?', 'options': ['21', '25', '80', '443'], 'correctIndex': 2},
        {'question': 'Physical layer device?', 'options': ['Router', 'Switch', 'Hub', 'Bridge'], 'correctIndex': 2},
      ],
      'Operating System': [
        {'question': 'Core of OS?', 'options': ['Shell', 'Kernel', 'GUI', 'BIOS'], 'correctIndex': 1},
        {'question': 'Not an OS?', 'options': ['Windows', 'Linux', 'Oracle', 'Android'], 'correctIndex': 2},
        {'question': 'Deadlock is?', 'options': ['Loop', 'Resource waiting', 'Crash', 'Memory full'], 'correctIndex': 1},
        {'question': 'Round Robin is?', 'options': ['Disk Sched.', 'CPU Sched.', 'Memory Mgmt', 'Paging'], 'correctIndex': 1},
        {'question': 'Virtual memory relates to?', 'options': ['RAM', 'Hard Disk', 'Cache', 'ROM'], 'correctIndex': 0},
      ],
      'DBMS': [
        {'question': 'SQL stands for?', 'options': ['Structured Query', 'Simple Queue', 'Symbol List', 'None'], 'correctIndex': 0},
        {'question': 'Unique identifier?', 'options': ['Foreign Key', 'Primary Key', 'Super Key', 'Candidate'], 'correctIndex': 1},
        {'question': 'ACID D stands for?', 'options': ['Data', 'Durability', 'Density', 'Design'], 'correctIndex': 1},
        {'question': 'Remove table command?', 'options': ['Delete', 'Remove', 'Drop', 'Clear'], 'correctIndex': 2},
        {'question': 'ER Model?', 'options': ['Entry Rel.', 'Entity Relationship', 'End Report', 'None'], 'correctIndex': 1},
      ],
      'Algorithms': [
        {'question': 'Divide & Conquer sort?', 'options': ['Bubble', 'Merge', 'Insertion', 'Selection'], 'correctIndex': 1},
        {'question': 'Quick sort worst case?', 'options': ['O(n)', 'O(n^2)', 'O(n log n)', 'O(1)'], 'correctIndex': 1},
        {'question': 'Greedy algorithm example?', 'options': ['Huffman', 'Binary Search', 'DFS', 'Matrix'], 'correctIndex': 0},
        {'question': 'Fastest for small data?', 'options': ['Quick', 'Heap', 'Insertion', 'Bubble'], 'correctIndex': 2},
        {'question': 'Bellman-Ford use?', 'options': ['Shortest Path', 'Sorting', 'Searching', 'Encryption'], 'correctIndex': 0},
      ],
      'Compiler Design': [
        {'question': 'Checks grammar?', 'options': ['Lexical', 'Syntax', 'Semantic', 'Code Gen'], 'correctIndex': 1},
        {'question': 'Compiler translates to?', 'options': ['High level', 'Machine code', 'Byte code', 'Source'], 'correctIndex': 1},
        {'question': 'TAC full form?', 'options': ['Access Control', 'Three Address Code', 'Text Auto'], 'correctIndex': 1},
        {'question': 'Symbol table managed by?', 'options': ['Lexical', 'All phases', 'Linker', 'Loader'], 'correctIndex': 1},
        {'question': 'Lexeme sequence of?', 'options': ['Error', 'Characters', 'Token', 'Variable'], 'correctIndex': 1},
      ],
      'Software Engineering': [
        {'question': 'Linear Sequential model?', 'options': ['Spiral', 'Waterfall', 'Agile', 'RAD'], 'correctIndex': 1},
        {'question': 'SDLC stands for?', 'options': ['Design Cycle', 'Development Life Cycle', 'System Data'], 'correctIndex': 1},
        {'question': 'Beta testing by?', 'options': ['Developers', 'Users', 'Stress', 'Machines'], 'correctIndex': 1},
        {'question': 'SRS stands for?', 'options': ['Requirement Spec.', 'Resource Script', 'System Req.', 'None'], 'correctIndex': 0},
        {'question': 'Agile method?', 'options': ['Waterfall', 'Scrum', 'V-model', 'Big Bang'], 'correctIndex': 1},
      ],
      'Artificial Intelligence': [
        {'question': 'Father of AI?', 'options': ['Alan Turing', 'John McCarthy', 'Elon Musk', 'Jobs'], 'correctIndex': 1},
        {'question': 'Uninformed search?', 'options': ['A*', 'BFS', 'Greedy', 'Heuristic'], 'correctIndex': 1},
        {'question': 'NLP part of?', 'options': ['Hardware', 'AI', 'Database', 'Networking'], 'correctIndex': 1},
        {'question': 'Strong AI example?', 'options': ['Siri', 'Alexa', 'Self-aware', 'Chatbots'], 'correctIndex': 2},
        {'question': 'Turing test checks?', 'options': ['Speed', 'Intelligence', 'Memory', 'Security'], 'correctIndex': 1},
      ],
      'Digital Logic': [
        {'question': 'Universal Gate?', 'options': ['AND', 'OR', 'NAND', 'NOT'], 'correctIndex': 2},
        {'question': 'Binary of decimal 5?', 'options': ['100', '101', '110', '011'], 'correctIndex': 1},
        {'question': 'Bits in a Byte?', 'options': ['4', '8', '16', '32'], 'correctIndex': 1},
        {'question': 'Flip-flop stores?', 'options': ['1 bit', '2 bits', '4 bits', '8 bits'], 'correctIndex': 0},
        {'question': 'AND output is 1 if?', 'options': ['Any is 1', 'All are 1', 'All 0', 'None'], 'correctIndex': 1},
      ],
      'Cyber Security': [
        {'question': 'VPN full form?', 'options': ['Virtual Private Network', 'Voice Net', 'Visual Path', 'None'], 'correctIndex': 0},
        {'question': 'Phishing is?', 'options': ['Fishing', 'Fake emails', 'Speed test', 'Coding'], 'correctIndex': 1},
        {'question': 'Type of Malware?', 'options': ['RAM', 'Firewall', 'Virus', 'Router'], 'correctIndex': 2},
        {'question': 'Security in HTTPS?', 'options': ['Speed', 'SSL', 'Pages', 'Images'], 'correctIndex': 1},
        {'question': 'Firewall use?', 'options': ['Cooling', 'Filtering Network', 'Increase RAM', 'None'], 'correctIndex': 1},
      ],
    };

    try {
      for (var entry in allData.entries) {
        // পুরনো প্রশ্ন ডিলিট করা
        var collection = firestore.collection('Subjects').doc(entry.key).collection('Questions');
        var snapshots = await collection.get();
        for (var doc in snapshots.docs) {
          await doc.reference.delete();
        }
        // নতুন প্রশ্ন আপলোড করা
        for (var q in entry.value) {
          await collection.add(q);
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All 50 Questions Uploaded Successfully!"), backgroundColor: Colors.green),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.cloud_upload),
        label: const Text("Update All Questions"),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
        onPressed: () => uploadQuestions(context),
      ),
    );
  }
}
