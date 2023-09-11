import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Replace with your actual task list length
      itemBuilder: (context, index) {
        // Create a widget to display each task
        return ListTile(
          title: Text('Task $index'),
          // Add more details about the task here
        );
      },
    );
  }
}
