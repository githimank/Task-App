import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/models/tasks.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: ((context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              onLongPress: () => BlocProvider.of<TasksBloc>(context)
                  .add(DeleteTask(task: task)),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  BlocProvider.of<TasksBloc>(context)
                      .add(UpdateTask(task: task));
                },
              ),
            );
          })),
    );
  }
}
