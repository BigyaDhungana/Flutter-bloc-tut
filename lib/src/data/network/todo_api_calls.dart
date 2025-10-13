import 'package:dio/dio.dart';
import 'package:todo_app/src/data/models/todo_model.dart';

class TodoApiCalls {
  final Dio dio;

  TodoApiCalls()
    : dio = Dio(BaseOptions(baseUrl: 'http://jsonplaceholder.typicode.com/'));

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await dio.get('todos');
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
      final response = await dio.post('todos', data: todo.toJson());
      return TodoModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
