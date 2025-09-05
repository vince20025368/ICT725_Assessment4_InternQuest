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
      home: MackDCivilApplication(),
    );
  }
}

class MackDCivilApplication extends StatelessWidget {
  final String email = 'careers@mdc.com.au';
  final String company = 'Mack D Civil';
  final String role = 'Junior Project Management Intern';
  final String address = '652 Bonds Rd, Barangaroo';
  final String status = 'N/A';
  final String profileImage = 'assets/images/mackdcivil.png';

  final List<String> responsibilities = [
    'Assist in planning, scheduling, and tracking project milestones and deliverables',
    'Support cross-functional teams with documentation, meeting notes, and task follow-ups',
    'Help maintain project dashboards, timelines, and resource allocations',
    'Coordinate communication between stakeholders, vendors, and internal teams',
    'Participate in risk assessments and contribute to issue resolution strategies',
    '- Contribute to post-project reviews and continuous improvement initiatives',
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
                                fontSize: 30,
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
                'Join our team as a Junior Project Management Intern and gain hands-on experience supporting real-world projects from initiation to delivery. This internship is designed for motivated individuals who thrive in fast-paced environments, enjoy solving problems, and want to build a strong foundation in project coordination and stakeholder engagement.',
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