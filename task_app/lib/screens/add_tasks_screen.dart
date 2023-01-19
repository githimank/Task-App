import 'package:flutter/material.dart';
import 'package:task_app/models/tasks.dart';

import '../blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
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
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(title: textEditingController.text);
                  BlocProvider.of<TasksBloc>(context).add(AddTask(task: task));
                  // context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
