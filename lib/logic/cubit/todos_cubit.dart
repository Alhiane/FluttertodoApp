import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosapp/data/models/todo.dart';
import 'package:todosapp/data/providers/api/todos.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Todos todosApi;

  TodosCubit(this.todosApi) : super(TodosInitial());

// getting all todos
  void getAllTodos() async {
    emit(TodosInitial());
    try {
      final List<Todo> todos = await todosApi.getAllTodos();
      // print(todos);
      emit(TodosLoad(todos));
    } catch (e) {
      // print(e);
      // emit(TodosLoad(todosList));
    }
  }

  // getting todo x details
  void getTodoDetails(id) async {
    emit(TodosInitial());
    try {
      final todoDetails = await todosApi.getTodoDetails(id);
      emit(TodoDetailsLoad(todoDetails));
    } catch (e) {
      print(e);
      // emit(TodosLoad(todosList));
    }
  }
}
