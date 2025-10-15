import 'package:todo_app/src/core/network/network_base.dart';
import 'package:todo_app/src/data/models/todo_model.dart';

class TodoApiCalls {
  final NetworkInit apiClient;

  TodoApiCalls(this.apiClient);

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await apiClient.dio.get('todos');
      final List data = response.data;
      final List<TodoModel> todos = data
          .map((element) => TodoModel.fromJson(element))
          .toList();
      return todos;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<TodoModel> addTodo({required TodoModel todo}) async {
    try {
      final response = await apiClient.dio.post('todos', data: todo.toJson());
      return TodoModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
