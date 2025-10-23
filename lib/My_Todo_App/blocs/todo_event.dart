// abstract class TodoEvent {}
//
// class AddTodo extends TodoEvent {
//   final String task;
//   AddTodo(this.task);
// }

abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
}

class DeleteTodo extends TodoEvent {
  final int index;
  DeleteTodo(this.index);
}

class EditTodo extends TodoEvent {
  final int index;
  final String updatedTask;
  EditTodo({required this.index, required this.updatedTask});
}
