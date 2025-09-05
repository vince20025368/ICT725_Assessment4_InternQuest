import 'package:flutter/material.dart';
import 'package:internquest/applicationforMack.dart';
import 'package:internquest/applicationforMcdonalds.dart';
import 'package:internquest/applicationforNAB.dart';
import 'package:internquest/applicationforNapierBlake.dart';
import 'package:internquest/login.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

void main() => runApp(InternshipApp());

class InternshipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AvailableInternships(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AvailableInternships extends StatelessWidget {
  final String logo = "Internquest";
  final String userName = 'Vince Atienza';
  final String userEmail = '20025368@gmail.com';

  final List<Map<String, String>> internships = [
    {
      'company': 'McDonald\'s Australia (1km)',
      'title': 'IT Infrastructure Intern',
    },
    {
      'company': 'Mack D\' Civil (1km)',
      'title': 'Junior Project Management Intern',
    },
    {
      'company': 'Napier and Blakeley (1.2km)',
      'title': 'Risk Assessor Intern',
    },
    {
      'company': 'National Australian Bank (1.2km)',
      'title': 'Compliance Assessor Intern',
    },
  ];

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
                              fontSize: 30,
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

            // Internship list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: internships.length,
                itemBuilder: (context, index) {
                  final item = internships[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['company']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(item['title']!, style: TextStyle(color: Colors.grey[700])),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Widget detailPage;
                                switch (index) {
                                  case 0:
                                    detailPage = McdonaldsApplication();
                                    break;
                                  case 1:
                                    detailPage = MackDCivilApplication();
                                    break;
                                  case 2:
                                    detailPage = NapierBlakelyApplication();
                                    break;
                                  case 3:
                                    detailPage = NABApplication();
                                    break;
                                  default:
                                    detailPage = Scaffold(
                                      body: Center(child: Text('Page not found')),
                                    );
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => detailPage),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text('Apply Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
          case 'Settings':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
            break;
          case 'Messages':
            break;
          case 'Log Out':
            Navigator.push(
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
