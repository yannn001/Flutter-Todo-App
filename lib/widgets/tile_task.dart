import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;
  final VoidCallback onDismissed;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(taskTitle),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: const Color.fromARGB(255, 231, 6, 6),
        child: Icon(
          Icons.delete_forever,
          color: Colors.black,
          size: 28.0,
        ),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          gradient: isChecked
              ? const LinearGradient(
                  colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isChecked ? null : Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            minTileHeight: 65,
            onLongPress: longPressCallback,
            title: Text(
              taskTitle,
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null,
                color: Colors.white,
              ),
            ),
            trailing: Checkbox(
              focusColor: Colors.black,
              checkColor: Colors.black,
              activeColor: const Color.fromARGB(255, 70, 255, 64),
              value: isChecked,
              onChanged: checkboxCallback,
            ),
          ),
        ),
      ),
    );
  }
}
