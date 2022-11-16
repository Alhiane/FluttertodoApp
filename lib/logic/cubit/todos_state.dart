part of 'todos_cubit.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoad extends TodosState {
  final List<Todo> todos;

  const TodosLoad(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoDetailsLoad extends TodosState {
  final Todo details;

  const TodoDetailsLoad(this.details);

  @override
  List<Object> get props => [details];
}

class ErrorState extends TodosState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
