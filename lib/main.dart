import 'package:flutter/material.dart';
import 'package:internquest/login.dart';
import 'package:internquest/userpage.dart';
import 'package:internquest/resume_builder.dart';
import 'package:internquest/settings.dart';
import 'package:internquest/view_my_application.dart';
import 'package:internquest/practicequestions.dart';
import 'package:internquest/searchinternships.dart';
import 'package:internquest/messages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternQuest',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/resume builder': (context) => ResumeBuilder(),
        '/settings': (context) => ProfileScreen(),
        '/viewapplication': (context)=> ApplicationPage(),
        '/practice questions': (context)=> QuestionDashboard(),
        '/searchinternships': (context)=> ProfileSearchScreen(),
        '/messages': (context)=> MessageDashboard(),
      },
    );
  }
}
