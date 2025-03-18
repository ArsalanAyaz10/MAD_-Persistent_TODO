
import 'package:flutter/material.dart';
import 'package:persistent_todo/Widgets/backgroundClipper.dart';
import 'package:persistent_todo/Widgets/teamCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color primary = Color.fromARGB(255, 249, 234, 132);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Default background color
      drawer: Drawer(
        elevation: 2,
        width: 250,
        backgroundColor: Colors.white30,
        shape: Border.all(),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Center(child: Text("Team Members", style: TextStyle(fontSize: 22))),
            Divider(color: Colors.black),
            SizedBox(height: 20),
            Column(
              children: [
                buildTeamCard("Arsalan Ayaz", "2280139"),
                buildTeamCard("Mirza Usman Baig", "2280148"),
                buildTeamCard("Rafay Hussain", "2280158"),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(backgroundColor: primary),
      body: Stack(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              color: primary,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          HomeUI(),
        ],
      ),
    );
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Arsalan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "You have x Tasks",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  "assets/Avatar.jpg",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Center(
                child: Card.outlined(
                  shape: RoundedRectangleBorder(),
                  elevation: 3,
                  child: ListTile(
                    title: Text("Today"),
                    subtitle: Text("4 Task"),
                    leading: Icon(Icons.wb_sunny_sharp, color: Colors.amber),
                    trailing: Icon(Icons.more_vert_sharp),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
              child: Center(
                child: Card.outlined(
                  shape: RoundedRectangleBorder(),
                  elevation: 3,
                  child: ListTile(
                    title: Text("Planned"),
                    subtitle: Text("2 Task"),
                    leading: Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.amber,
                    ),
                    trailing: Icon(Icons.more_vert_sharp),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
              child: Center(
                child: Card.outlined(
                  shape: RoundedRectangleBorder(),
                  elevation: 3,
                  child: ListTile(
                    title: Text("Work"),
                    subtitle: Text("12 Task"),
                    leading: Icon(
                      Icons.work_history_sharp,
                      color: Colors.amber,
                    ),
                    trailing: Icon(Icons.more_vert_sharp),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
              child: Center(
                child: Card.outlined(
                  shape: RoundedRectangleBorder(),
                  elevation: 3,
                  child: ListTile(
                    title: Text("Shopping"),
                    subtitle: Text("9 Task"),
                    leading: Icon(
                      Icons.shopping_bag_sharp,
                      color: Colors.amber,
                    ),
                    trailing: Icon(Icons.more_vert_sharp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
