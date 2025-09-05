import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

class DeveloperQuestions extends StatelessWidget {
  final Map<String, List<String>> questions = {
    'Generic Developer Questions': [
      'What programming languages are you most comfortable with, and why?',
      'How do you approach debugging a complex issue in your code?',
      'What’s the difference between synchronous and asynchronous operations',
      'How do you manage version control in your projects?',
    ],
    'Behavioural Questions': [
      'Describe a situation where you disagreed with a teammate about a technical decision. How did you resolve it?',
      'Tell me about a time you had to debug a critical issue under pressure. What was your approach?',
      'Describe a moment when you had to quickly learn a new technology or framework to complete a task.',
    ],
    'Situational Questions': [
      ' A user reports a bug that you cant reproduce. What would be your troubleshooting process?',
      'Suppose a client requests a last-minute feature change that conflicts with the current sprint. How would you respond?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Developer Interview Guide')),

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
