import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

class UIUXQuestions extends StatelessWidget {
  final Map<String, List<String>> questions = {
    'Generic UI/UX Questions': [
      'What is the difference between UI and UX design?',
      'How do you approach designing for accessibility?',
      'How do you ensure consistency across different screens or platforms',
      'What is the role of usability testing in the design process?',
    ],
    'Behavioural Questions': [
      'Describe a situation where you had to advocate for the user in a business-driven project?',
      'How do you stay updated with the latest design trends and tools?',
      'How do you prioritize features when designing a new interface?',
    ],
    'Situational Questions': [
      'You’re given analytics showing users drop off at a certain screen. What’s your next step?',
      'You’re tasked with designing a dashboard for a complex data set. How do you ensure clarity?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('UI/UX Interview Guide')),

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
