import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PopupMenuItem<String> _buildDropdownMenuItem(String title) {
    return PopupMenuItem<String>(
      value: title,
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Implement logic for handling dropdown menu selection
            },
            itemBuilder: (context) => [
              _buildDropdownMenuItem('Main List'),
              _buildDropdownMenuItem('Completed Tasks'),
              _buildDropdownMenuItem('Create New List'),
            ],
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement the search functionality
            },
          ),
        ],
      ),
      body: TaskList(), // Now, TaskList is defined below
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement the logic to add a new task
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

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
