import 'package:todo_app/src/core/network/network_base.dart';
import 'package:todo_app/src/data/data_sources/todo_api_calls.dart';
import 'package:todo_app/src/data/models/todo_model.dart';

class TodoRepository {
  final TodoApiCalls _apiCalls;

  TodoRepository(NetworkInit apiClient) : _apiCalls = TodoApiCalls(apiClient);
  Future<List<TodoModel>> getTodos() async {
    try {
      final todos = await _apiCalls.getTodos();
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<TodoModel> addTodo(TodoModel todo) async {
    try {
      final newTodo = await _apiCalls.addTodo(todo: todo);
      return newTodo;
    } catch (e) {
      rethrow;
    }
  }
}
