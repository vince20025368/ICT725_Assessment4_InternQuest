import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';

void main() => runApp(InternQuestMail());

class InternQuestMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternQuest Mail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MessageDashboard(),
    );
  }
}

class MessageDashboard extends StatelessWidget {
  final List<String> folders = ['Inbox', 'Outbox', 'Sent Items', 'Trash'];

  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Tiffany Newsome',
      'role': 'HR at Procter & Gamble',
      'message': 'Did you get the job at Procter and Gamble?',
      'verified': true,
      'image': 'assets/images/hr1.jpg',
    },
    {
      'name': 'Sheila Watson',
      'role': 'HR at Intuit',
      'message': 'Hi Vince, congratulations on passing the interview!',
      'verified': true,
      'image': 'assets/images/hr2.jpg',
    },
    {
      'name': 'Brad Guildford',
      'role': 'HR at Xcline',
      'message': 'Hi Vince, we regret that you were shortlisted for the position.',
      'verified': true,
      'image': 'assets/images/hr3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar with Profile and Centered Folders
          Container(
            width: 160,
            color: Colors.indigo[100],
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(('assets/images/vince.jpg')),
                ),
                const SizedBox(height: 12),
                Text('Vince Atienza',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('20025368@gmail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: folders
                        .map((folder) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.mail_outline, color: Colors.white),
                        title: Text(folder, style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),

          // Main Message Panel
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (_, index) {
                      final msg = messages[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: Stack(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(msg['image']),
                                backgroundColor: Colors.grey[200],
                              ),
                              if (msg['verified'])
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Icon(Icons.check_circle,
                                      color: Colors.green, size: 18),
                                ),
                            ],
                          ),
                          title: Text(msg['name'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(msg['role'], style: TextStyle(color: Colors.grey[600])),
                              SizedBox(height: 4),
                              Text(msg['message']),
                            ],
                          ),
                          isThreeLine: true,
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Floating Compose Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Compose new message')),
          );
        },
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
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
