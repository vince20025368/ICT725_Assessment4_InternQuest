import 'package:flutter/material.dart';
import 'package:internquest/available_internships.dart';
import 'package:internquest/login.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/userpage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(ProfileSearchApp());

class ProfileSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternQuest Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ProfileSearchScreen(),
    );
  }
}

class ProfileSearchScreen extends StatefulWidget {
  @override
  State<ProfileSearchScreen> createState() => _ProfileSearchScreenState();
}

class _ProfileSearchScreenState extends State<ProfileSearchScreen> {
  double _sliderValue = 85;
  final String Logo ="Internquest";
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

            // 🌍 Map Integration
            Container(
              height: 300,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(-33.865143, 151.209900), // Sydney
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.internquest.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(-33.865143, 151.209900),
                          width: 40,
                          height: 40,
                          child: Icon(Icons.location_pin, color: Colors.red, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '(Pen tester, Network)',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Range Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: '${_sliderValue.round()}KM',
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                  Text('Range: ${_sliderValue.round()}Km',
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Search Button
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AvailableInternships()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Search', style: TextStyle(fontSize: 16)),
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