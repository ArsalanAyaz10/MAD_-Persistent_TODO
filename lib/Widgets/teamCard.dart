  import 'package:flutter/material.dart';

Widget buildTeamCard(String name, String id) {
    return Card(
      shadowColor: Colors.black,
      elevation: 3,
      shape: OutlineInputBorder(),
      child: ListTile(title: Text(name), trailing: Text(id)),
    );
  }