import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

class AIQuestions extends StatelessWidget {
  final Map<String, List<String>> questions = {
    'Generic AI Questions': [
      'What is the difference between supervised, unsupervised, and reinforcement learning?',
      'How does a neural network work?',
      'What are activation functions and why are they important?',
      'How do decision trees differ from random forests',
    ],
    'Behavioural Questions': [
      'Tell me about a time you built or contributed to an AI model. What was your role?',
      'How do you stay current with advancements in AI and machine learning?',
      'How do you balance accuracy with interpretability in your models?',
    ],
    'Situational Questions': [
      'You’re given a dataset with missing values and outliers. What’s your approach?',
      'You’re asked to build a recommendation engine for a new app. Where do you start?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('AI Interview Guide')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 📋 Question Sections (No Info Card)
            ...questions.entries.map((entry) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.key,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...entry.value.map((q) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('• $q'),
                )),
                const SizedBox(height: 20),
              ],
            )),
          ],
        ),
      ),

      // 🔻 Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.indigo[400],
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navIcon(Icons.home, 'Home', context),
            _navIcon(Icons.message, 'Messages', context),
            _navIcon(Icons.settings, 'Settings', context),
            _navIcon(Icons.logout, 'Log Out', context),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () {
        switch (label) {
          case 'Home':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
            break;
          case 'Messages':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessageDashboard()),
            );
            break;
          case 'Settings':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
            break;
          case 'Log Out':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label tapped')),
            );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
