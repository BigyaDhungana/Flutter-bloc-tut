part of 'todo_bloc.dart';

sealed class TodoEvent {}

class TodoAdded extends TodoEvent {
  final TodoModel todo;
  TodoAdded({required this.todo});
}

class TodosFetchRequested extends TodoEvent {}
