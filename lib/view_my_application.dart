import 'package:flutter/material.dart';
import 'package:internquest/ethanglobalinternship.dart';
import 'package:internquest/intuit_internshipapplication.dart';
import 'package:internquest/login.dart';
import 'package:internquest/messages.dart';
import 'package:internquest/procter&gamble_internshipp%20application.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApplicationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ApplicationPage extends StatelessWidget {
  final String logo = "InternQuest";
  final String userName = 'Vince Atienza';
  final String userEmail = '20025368@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              color: Colors.indigo[400],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/vince.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(logo,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(userName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(userEmail,
                          style: const TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),

            // Application list + pagination
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      children: [
                        ApplicationCard(
                          company: 'Intuit Australia',
                          title: 'Software Developer Intern',
                          status: 'Passed',
                          logoPath: 'assets/images/intuit.jpg',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => IntuitInternship()),
                            );
                          },
                        ),
                        ApplicationCard(
                          company: 'Ethan Global',
                          title: 'Network Infrastructure Intern',
                          status: 'Passed',
                          logoPath: 'assets/images/ethan.jpeg',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EthanGlobalInternship()),
                            );
                          },
                        ),
                        ApplicationCard(
                          company: 'Procter and Gamble',
                          title: 'Quality Assurance Tester',
                          status: 'Pending',
                          logoPath: 'assets/images/pg.jpeg',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProcterGambleInternship()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Pagination control
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_left, color: Colors.indigo),
                        for (int i = 1; i <= 2; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == 1 ? Colors.indigo : Colors.grey[300],
                            ),
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            child: Text(
                              '$i',
                              style: TextStyle(
                                color: i == 1 ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Icon(Icons.arrow_right, color: Colors.indigo),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final String company;
  final String title;
  final String status;
  final String logoPath;
  final VoidCallback onPressed;

  const ApplicationCard({
    required this.company,
    required this.title,
    required this.status,
    required this.logoPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Passed' ? Colors.green : Colors.orange;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    logoPath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),

                // Company Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(company,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(title),
                      const SizedBox(height: 8),
                      Text('Status: $status', style: TextStyle(color: statusColor)),
                    ],
                  ),
                ),
              ],
            ),

            // View Button (moved below to prevent overflow)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onPressed,
                child: const Text('View Application'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}