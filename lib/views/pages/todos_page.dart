import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosapp/data/providers/api/todos.dart';
import 'package:todosapp/logic/cubit/todos_cubit.dart';
import 'package:todosapp/views/widgets/loading_widget.dart';
import 'package:todosapp/views/widgets/todos_list_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TodosApp')),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          
          if (state is TodosLoad) {
            return TodosListWidget(state.todos, Todos());
          } else {
            return const LoadingWidget();
          }
          
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add_card), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
