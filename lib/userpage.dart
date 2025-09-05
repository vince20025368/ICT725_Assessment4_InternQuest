import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/practicequestions.dart';
import 'package:internquest/resume_builder.dart';
import 'package:internquest/searchinternships.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/view_my_application.dart';

void main() {
  runApp(InternQuestApp());
}

class InternQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternQuest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.indigo),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final String Logo = "Internquest";
  final String userName = 'Vince Atienza';
  final String userEmail = '20025368@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Bottom Navigation Bar properly placed
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
        color: Colors.indigo[400], // remove BoxDecoration
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


      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
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

            // Dashboard Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildTile(context, Icons.assignment, 'View My Application'),
                    _buildTile(context, Icons.search, 'Search Internships'),
                    _buildTile(context, Icons.description, 'Resume'),
                    _buildTile(context, Icons.message, 'Organization Messages'),
                    _buildTile(context, Icons.quiz, 'Practice Questions'),
                    _buildTile(context, Icons.settings, 'Settings'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: () {
          switch (label) {
            case 'Resume':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResumeBuilder()));
              break;
            case 'Settings':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
              break;
            case 'View My Application':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApplicationPage()));
              break;
            case 'Practice Questions':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuestionDashboard()));
              break;
            case 'Search Internships':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileSearchScreen()));
              break;
            case 'Organization Messages':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessageDashboard()));
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$label tapped')),
              );
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.indigo),
              SizedBox(height: 12),
              Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () {
        switch (label) {
          case 'Home':
            break;
          case 'Settings':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
            break;
          case 'Messages':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MessageDashboard()));
            break;
          case 'Log Out':
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label tapped')),
            );
            break;
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
