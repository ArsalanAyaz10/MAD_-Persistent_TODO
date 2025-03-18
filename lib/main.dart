import 'package:flutter/material.dart';
import 'package:persistent_todo/Screens/HomeScreen.dart';
import 'package:persistent_todo/Screens/getStarted.dart';
import 'Widgets/teamCard.dart';
import 'Widgets/backgroundClipper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Getstarted());
  }
}
