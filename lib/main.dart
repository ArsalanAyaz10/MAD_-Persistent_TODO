import 'package:flutter/material.dart';
import 'package:persistent_todo/Screens/HomeScreen.dart';
import 'package:persistent_todo/Screens/getStarted.dart';
import 'package:persistent_todo/provider/TaskProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Taskprovider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String?> _getStoredName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name'); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getStoredName(),
      builder: (context, snapshot) {
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

      
        final String? name = snapshot.data;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: name != null && name.isNotEmpty
              ? MyHomePage(name: name)
              : Getstarted(),
        );
      },
    );
  }
}
