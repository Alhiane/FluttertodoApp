import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosapp/data/providers/api/todos.dart';
import 'package:todosapp/logic/cubit/todos_cubit.dart';
import 'package:todosapp/views/widgets/loading_widget.dart';
import 'package:todosapp/views/widgets/todo_widget.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails(this.id, {super.key});

  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Details')),
      body: BlocBuilder<TodosCubit, TodosState>(
          bloc: TodosCubit(Todos())..getTodoDetails(id),
          builder: (context, state) {
            if (state is TodoDetailsLoad) {
              return TodoDetailWiget(state.details);
            } else {
              return const LoadingWidget();
            }
          }),
    );
  }
}
