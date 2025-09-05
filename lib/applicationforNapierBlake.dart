import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

void main() => runApp(InternshipApp());

class InternshipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternQuest Internship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: NapierBlakelyApplication(),
    );
  }
}

class NapierBlakelyApplication extends StatelessWidget {
  final String email = 'napierblakely.com.au';
  final String company = 'Napier Blakely';
  final String role = 'Risk Assessor Intern';
  final String address = '31/33 Hunter St. Wynyard';
  final String status = 'N/A';
  final String profileImage = 'assets/images/napierblakely.png';

  final List<String> responsibilities = [
    'Assist in conducting risk assessments across property, financial, and operational domains',
    'Support data collection, analysis, and reporting for risk evaluation projects',
    'Help maintain documentation of risk profiles, mitigation plans, and audit findings',
    'Participate in site inspections and contribute to hazard identification processes',
    'Collaborate with cross-functional teams to ensure compliance with safety and regulatory standards',
    'Contribute to the development of risk dashboards and performance tracking tools',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          profileImage,
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
                        Text(company,
                            style: const TextStyle(
                                fontSize: 28.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(email,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(address,
                            style: const TextStyle(fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Internship Info
              Text(company,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
              Text(role, style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('Status: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(status, style: TextStyle(color: Colors.orange)),
                ],
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                'Are you curious about how organizations identify and manage risk across operations, assets, and compliance? As a Risk Assessor Intern, you’ll be part of a team that evaluates vulnerabilities, analyzes data, and supports strategic decision-making to protect business integrity.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),

              // Responsibilities
              Text('Responsibilities:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...responsibilities.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check, size: 16, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item)),
                  ],
                ),
              )),

              const SizedBox(height: 24),
              Text(
                '*All information will be pre-filled based on your profile in InternQuest App*',
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[400],
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Back to Search', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Application submitted')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[400],
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Apply', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
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