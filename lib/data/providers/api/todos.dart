import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todosapp/data/models/todo.dart';
// import 'package:http/http.dart' as http;

class Todos {
  // getting all todos => List
  Future<List<Todo>> getAllTodos() async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/todos';

      // var response = await http.get(Uri.parse(url));
      var response = await Dio().get(url);

      List<Todo> todosResult = (response.data as List)
          .map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo))
          .toList();

      return todosResult;
    } catch (e) {
      rethrow;
    }
  }

  // getting todo x details
  Future<Todo> getTodoDetails(id) async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/todos/';

      var response = await Dio().get(url + id.toString());
      return Todo.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
