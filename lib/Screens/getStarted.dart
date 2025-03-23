import 'package:flutter/material.dart';
import 'package:persistent_todo/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  buildUI({super.key});

  TextEditingController controller = TextEditingController();

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

              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 30,
                  right: 30,
                ),
                child: TextFormField(
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "User Name",
                    prefixIcon: const Icon(Icons.event_note_outlined),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 246, 246, 246),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: GradientButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                MyHomePage(name: controller.text.trim()),
                      ),
                    );
                    _storeName(controller.text.trim());
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

  const GradientButton({super.key, required this.text, required this.onPressed});

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

Future<void> _storeName(String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
}
