part of 'todo_bloc.dart';

sealed class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todoList;
  TodoLoaded(this.todoList);
}

class TodoError extends TodoState {
  final String error;
  TodoError(this.error);
}
