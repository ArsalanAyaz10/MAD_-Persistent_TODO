import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_todo/provider/TaskProvider.dart';
import 'package:provider/provider.dart';

Future<void> showMyDialog(BuildContext context) async {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _desc_controller = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: const Text('Add Task'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titlecontroller,
                  decoration: InputDecoration(
                    labelText: "Task Title",
                    prefixIcon: const Icon(Icons.event_note_outlined),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 246, 246, 246),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _desc_controller,
                  decoration: InputDecoration(
                    labelText: "Task Description",
                    prefixIcon: const Icon(Icons.pending_actions),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 246, 246, 246),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task Description';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_titlecontroller.text.isEmpty ||
                    _desc_controller.text.isEmpty) {
                  return;
                }
                context.read<Taskprovider>().addTask(
                  _titlecontroller.text,
                  _desc_controller.text,
                  false,
                );
                _titlecontroller.clear();
                _desc_controller.clear();
                Navigator.of(context).pop();
                if (kDebugMode) {
                  print("Task Length: ${context.read<Taskprovider>().tasks.length}");
                }
              },
              child: Text("Add"),
            ),
          ),
        ],
      );
    },
  );
}
