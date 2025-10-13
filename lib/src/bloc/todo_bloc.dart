import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/data/models/todo_model.dart';
import 'package:todo_app/src/data/network/todo_api_calls.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoApiCalls apiClient;
  List<TodoModel> todosList = [];

  TodoBloc({required this.apiClient}) : super(TodoInitial()) {
    on<TodosFetchRequested>(_onTodosFetchRequested);
    on<TodoAdded>(_onTodoAdded);
  }

  Future<void> _onTodosFetchRequested(
    TodosFetchRequested event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    try {
      todosList = await apiClient.getTodos();
      emit(TodoLoaded(todosList));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onTodoAdded(TodoAdded event, Emitter<TodoState> emit) async {
    emit(TodoLoading());

    try {
      final addedTodo = await apiClient.addTodo(todo: event.todo);
      todosList.add(addedTodo);
      emit(TodoLoaded(todosList));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
