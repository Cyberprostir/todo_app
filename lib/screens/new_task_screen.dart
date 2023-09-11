import 'package:flutter/material.dart';
import '../task.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  DateTime? selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Нове завдання'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Назва завдання',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Введіть назву завдання',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Терміни виконання',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : 'Вибрати дату'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String taskTitle = titleController.text;
                if (taskTitle.isNotEmpty && selectedDate != null) {
                  Task newTask = Task(
                    title: taskTitle,
                    deadline: selectedDate!,
                  );
                }
              },
              child: Text('Додати в список'),
            ),
          ],
        ),
      ),
    );
  }
}
