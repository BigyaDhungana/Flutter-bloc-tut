import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc.dart';
import 'package:todo_app/src/data/models/todo_model.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All todos"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            switch (state) {
              case TodoInitial():
                context.read<TodoBloc>().add(TodosFetchRequested());
                return Center(child: Text("You should not be seeing this"));
              case TodoLoading():
                return Center(child: CircularProgressIndicator());
              case TodoLoaded():
                final todoList = state.todoList;
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 3),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];
                    return ListTile(
                      title: Text(todo.title ?? ""),

                      tileColor: todo.completed == true
                          ? Colors.green
                          : Colors.red,
                      leading: Text('${todo.id}'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  },
                );
              case TodoError():
                return Text(state.error);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => FormDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FormDialog extends StatefulWidget {
  const FormDialog({super.key});

  @override
  State<FormDialog> createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add a to-do", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Form(
            key: _formkey,

            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Cannot be empty'
                      : null,
                  decoration: InputDecoration(
                    label: Text('title'),
                    border: OutlineInputBorder(),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              todoBloc.add(
                TodoAdded(
                  todo: TodoModel(
                    completed: false,
                    id: 0,
                    title: _titleController.text,
                    userId: 1,
                  ),
                ),
              );
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
