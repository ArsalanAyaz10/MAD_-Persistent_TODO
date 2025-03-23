import 'package:flutter/material.dart';
import 'package:persistent_todo/Models/TaskModel.dart';
import 'package:persistent_todo/Widgets/backgroundClipper.dart';
import 'package:persistent_todo/Widgets/teamCard.dart';
import 'package:persistent_todo/provider/TaskProvider.dart';
import 'package:provider/provider.dart';
import '../Widgets/dialogBox.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.name});

  late String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color primary = Color.fromARGB(255, 249, 234, 132);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      floatingActionButton: FloatingActionButton(
        autofocus: true,
        elevation: 5,
        backgroundColor: Colors.amber,
        mouseCursor: MouseCursor.defer,
        focusColor: Colors.yellowAccent,
        hoverColor: Colors.yellowAccent,
        onPressed: () async {
          await showMyDialog(context);
        },
        child: Icon(Icons.add),
      ),
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
          HomeUI(name: widget.name),
        ],
      ),
    );
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key, required this.name});

  final String name;

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
                      "Hello ${widget.name}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "You have ${Provider.of<Taskprovider>(context).tasks.length} Tasks",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 10),
            Selector<Taskprovider, List<Taskmodel>>(
              selector: (context, taskProvider) {
                taskProvider.fetchData();
                return taskProvider.tasks;
              },
              builder: (context, tasks, child) {
                if (tasks.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        "No tasks added yet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 25,
                        right: 25,
                      ),
                      child: Card.outlined(
                        shape: RoundedRectangleBorder(),
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration:
                                  task.status
                                      ? TextDecoration.lineThrough
                                      : null,
                              fontWeight:
                                  task.status
                                      ? FontWeight.w500
                                      : FontWeight.normal,
                              color: task.status ? Colors.grey : Colors.black,
                            ),
                          ),
                          subtitle: Text(task.description),
                          leading: Icon(
                            Icons.numbers_sharp,
                            color: Colors.amber,
                          ),
                          trailing: PopupMenuButton<String>(
                            color: Color.fromARGB(97, 229, 229, 50),
                            padding: EdgeInsets.all(10),
                            elevation: 1,
                            borderRadius: BorderRadius.circular(8),
                            onSelected: (value) {
                              final taskProvider = Provider.of<Taskprovider>(
                                context,
                                listen: false,
                              );
                              if (value == 'Remove Task') {
                                taskProvider.removeTask(id: task.id);
                              } else if (value == 'Mark as Completed') {
                                taskProvider.toggleTask(id: task.id);
                              }
                            },
                            itemBuilder:
                                (context) => [
                                  const PopupMenuItem(
                                    value: 'Mark as Completed',
                                    child: Text("Mark as Completed"),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Remove Task',
                                    child: Text("Delete Task"),
                                  ),
                                ],
                            icon: const Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
