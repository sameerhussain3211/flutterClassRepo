// import 'package:flutter/material.dart';
// // import 'package:http/http.dart';
// import 'package:provider/provider.dart';

// class TodoProvider extends ChangeNotifier {
//   final _service = TodoService();
//   bool isLoading = false;
//   List<Todo> _todos = [];
//   List<Todo> get todos => _todos;
//   Future<void> getAllTodos() async {
//     isLoading = true;
//     notifyListeners();
//     final Response = await _service.getAllTodos();

//     _todos = response;
//     isLoading = false;
//     notifyListeners();
//   }
// }
