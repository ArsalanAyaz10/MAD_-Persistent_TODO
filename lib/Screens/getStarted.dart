import 'package:flutter/material.dart';
import 'package:persistent_todo/Screens/HomeScreen.dart';
import 'package:persistent_todo/main.dart';

class Getstarted extends StatelessWidget {
  Getstarted({super.key});

  Color primary = Color.fromARGB(255, 249, 234, 132);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              color: primary,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          buildUI(),
        ],
      ),
    );
  }
}

class buildUI extends StatelessWidget {
  const buildUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Avatar.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Organize Your Life"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Tudy is a simple and effective to-do list and task manager app designed to manage your time",
                ),
              ),

              Center(
                child: GradientButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MyHomePage(title: "Persistent TODO"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
          border: Border(),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
