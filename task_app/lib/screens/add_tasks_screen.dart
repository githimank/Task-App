import 'package:flutter/material.dart';

import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/models/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: textEditingController,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(title: textEditingController.text);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.of(context);
                  },
                  child: const Text("Add"))
            ],
          ),
        ],
      ),
    );
  }
}
