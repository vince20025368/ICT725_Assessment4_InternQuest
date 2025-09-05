import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

class ItInfraQuestions extends StatelessWidget {
  final Map<String, List<String>> questions = {
    'Generic IT Infrastructure Questions': [
      'What’s the difference between a Layer 2 and Layer 3 switch',
      'How do you monitor network performance and detect bottlenecks?',
      'Can you explain the role of DNS in enterprise environments?',
      'What’s your experience with virtualization platforms like VMware or Hyper-V?',
    ],
    'Behavioural Questions': [
      'Tell me about a time you had to troubleshoot a critical outage under pressure.',
      'How do you handle conflicting priorities between technical requirements and business needs?',
      'Share an example of how you’ve mentored or supported junior team members.',
    ],
    'Situational Questions': [
      'A stakeholder insists on deploying a solution that violates best security practices. How do you respond?',
      'During a major upgrade, a critical system fails unexpectedly. What’s your immediate response?',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('IT Infrastructure Interview Guide')),

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
