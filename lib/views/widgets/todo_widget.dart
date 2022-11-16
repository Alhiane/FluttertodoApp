import 'package:flutter/material.dart';
import 'package:todosapp/data/models/todo.dart';

class TodoDetailWiget extends StatelessWidget {
  const TodoDetailWiget(this.todosList, {super.key});

  final Todo todosList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: todosList.completed
                ? Colors.greenAccent[700]
                : Colors.blueAccent[600],
            child: Text(todosList.id.toString()),
          ),
          title: Text(todosList.title),
          trailing: todosList.completed ? const Icon(Icons.done) : null,
          iconColor: Colors.green[700],
        ),
      ),
    );
  }
}
