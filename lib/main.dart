import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc.dart';
import 'package:todo_app/src/core/network/network_base.dart';
import 'package:todo_app/src/data/repositories/todo_repository.dart';
import 'package:todo_app/src/presentation/all_todo/all_todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(NetworkInit()),
      child: Builder(
        builder: (context) => BlocProvider(
          create: (_) => TodoBloc(context.read<TodoRepository>()),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const AllTodosPage(),
          ),
        ),
      ),
    );
  }
}
