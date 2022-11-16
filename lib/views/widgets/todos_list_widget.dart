import 'package:flutter/material.dart';
import 'package:todosapp/data/providers/api/todos.dart';
import 'package:todosapp/views/pages/todo_details.dart';

class TodosListWidget extends StatelessWidget {
  const TodosListWidget(this.todosList, this.todosApi, {super.key});

  final List todosList;

  final Todos todosApi;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todosList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: todosList[index].completed
                    ? Colors.greenAccent[700]
                    : Colors.blueAccent[600],
                child: Text(todosList[index].id.toString()),
              ),
              title: Text(todosList[index].title),
              trailing:
                  todosList[index].completed ? const Icon(Icons.done) : null,
              iconColor: Colors.green[700],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => TodoDetails(todosList[index].id)),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
