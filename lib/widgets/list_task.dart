import 'package:flutter/material.dart';
import 'package:todoo/widgets/tile_task.dart';
import 'package:provider/provider.dart';
import 'package:todoo/components/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallback: (bool? checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {},
                onDismissed: () {
                  taskData.deleteTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
