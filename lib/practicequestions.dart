import 'package:flutter/material.dart';
import 'package:internquest/aiquestions.dart';
import 'package:internquest/cybersecquestions.dart';
import 'package:internquest/developer_questions.dart';
import 'package:internquest/devopsquestions.dart';
import 'package:internquest/itinfra_questions.dart';
import 'package:internquest/javaquestions.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/networking_questions.dart';
import 'package:internquest/qaquestions.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';
import 'package:internquest/uxquestions.dart';

void main() => runApp(InternQuestApp());

class QuestionDashboard extends StatelessWidget {
  final String Logo ="Internquest";
  final String userName = 'Vince Atienza';
  final String userEmail = '20025368@gmail.com';

  final List<String> categories = [
    'Networking Questions',
    'Developer Questions',
    'IT Infrastructure Questions',
    'JAVA Questions',
    'Cybersecurity Questions',
    'AI Questions',
    'UI/UX Questions',
    'DevOps Questions',
    'QA Questions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            color: Colors.indigo[400],
            child: Row(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/vince.jpg', // Replace with your actual path
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Logo,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(userName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(userEmail,
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          // Grid of Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      final selected = categories[index];
                      if (selected == 'Networking Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => NetworkingQuestions()),
                        );
                      } else if (selected == 'Developer Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DeveloperQuestions()),
                        );
                      } else if (selected == 'IT Infrastructure Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ItInfraQuestions()),
                        );
                      } else if (selected == 'JAVA Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => JavaQuestions()),
                        );
                      } else if (selected == 'Cybersecurity Questions') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CybersecurityQuestions()),
                        );
                      } else if (selected == 'AI Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AIQuestions()),
                        );
                      } else if (selected == 'AI Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AIQuestions()),
                        );
                      } else if (selected == 'UI/UX Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => UIUXQuestions()),
                        );
                      } else if (selected == 'DevOps Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DevOpsQuestions()),
                        );
                      } else if (selected == 'QA Questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => QualityAssuranceQuestions()),
                        );
                      } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$selected tapped')),
                      );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(8),
                    ),
                    child: Text(
                      categories[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
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
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
