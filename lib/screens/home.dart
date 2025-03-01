import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/components/task_data.dart';
import 'package:todoo/widgets/list_task.dart';
import 'package:todoo/screens/add_task.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 30, right: 30, bottom: 30),
            child: AppBar(
              title: Text("Todoo"),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              centerTitle: true,
              backgroundColor: Colors.black87,
              leading: FloatingActionButton(
                onPressed: null,
                backgroundColor: Colors.grey[900],
                child: Icon(
                  Icons.task,
                  color: Colors.grey[700],
                ),
              ),
              actions: [
                FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AddTaskScreen(),
                    );
                  },
                  backgroundColor: Colors.grey[900],
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[700],
                  ),
                )
              ],
            )),
        Expanded(
          child: Consumer<TaskData>(
            builder: (context, taskData, child) {
              if (taskData.tasks.isEmpty) {
                // When no tasks exist
                return Center(
                  child: Text(
                    'No tasks yet!\nTap the + button to add some tasks.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                );
              } else {
                return TasksList();
              }
            },
          ),
        ),
      ]),
    );
  }
}
