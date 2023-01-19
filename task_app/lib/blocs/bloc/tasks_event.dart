// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  AddTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  DeleteTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  UpdateTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
