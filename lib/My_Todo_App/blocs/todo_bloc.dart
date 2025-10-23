import 'package:bloc/bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   TodoBloc() : super(const TodoState()) {
//     on<AddTodo>((event, emit) {
//       final updatedList = List<String>.from(state.todos)..add(event.task);
//       emit(TodoState(todos: updatedList));
//     });
//   }
// }

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final updatedList = List<String>.from(state.todos)..add(event.task);
      emit(TodoState(todos: updatedList));
    });

    on<DeleteTodo>((event, emit) {
      final updatedList = List<String>.from(state.todos)..removeAt(event.index);
      emit(TodoState(todos: updatedList));
    });

    on<EditTodo>((event, emit) {
      final updatedList = List<String>.from(state.todos);
      updatedList[event.index] = event.updatedTask;
      emit(TodoState(todos: updatedList));
    });
  }
}
