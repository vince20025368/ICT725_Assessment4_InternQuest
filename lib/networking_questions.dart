import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

class NetworkingQuestions extends StatelessWidget {
  final Map<String, List<String>> questions = {
    'Generic Networking Questions': [
      'Can you explain the difference between a switch and a router?',
      'How would you troubleshoot a network connectivity issue in a multi-user environment?',
      'What steps would you take to secure a workstation?',
      'What tools have you used for monitoring system performance?',
    ],
    'Behavioural Questions': [
      'Tell us about a time you solved a technical problem under pressure.',
      'How do you stay organized when juggling multiple support tickets or tasks?',
      'Have you ever worked with a team to implement a new system or upgrade?',
    ],
    'Situational Questions': [
      'Imagine you’re assisting with a system upgrade and a critical application suddenly crashes. How would you handle it and provide support?',
      'Suppose a team reports periodic connectivity issues, but everything seems fine on your initial check. What steps would you take next?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Networking Interview Guide')),

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
