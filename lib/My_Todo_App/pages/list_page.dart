import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_event.dart';
import '../blocs/todo_state.dart';

// class ListPage extends StatelessWidget {
//   const ListPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TodoBloc, TodoState>(
//       builder: (context, state) {
//         if (state.todos.isEmpty) {
//           return const Center(child: Text("No todos added yet"));
//         }
//         return ListView.builder(
//           itemCount: state.todos.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(state.todos[index]),
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  void _showEditDialog(BuildContext context, int index, String currentTask) {
    final TextEditingController controller = TextEditingController(text: currentTask);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Edit Todo"),
        content: TextField(
          controller: controller,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedTask = controller.text.trim();
              if (updatedTask.isNotEmpty) {
                context.read<TodoBloc>().add(EditTodo(index: index, updatedTask: updatedTask));
              }
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Delete Todo"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(DeleteTodo(index));
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoBloc, TodoState, List<String>>(
      selector: (state) => state.todos,
      builder: (context, todos) {
        if (todos.isEmpty) {
          return const Center(child: Text("No todos added yet"));
        }

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final task = todos[index];

            return Dismissible(
              key: Key(task + index.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                context.read<TodoBloc>().add(DeleteTodo(index));
              },
              background: Container(
                color: Colors.black12,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Text("${index + 1}."),
                title: Text(task),
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (sheetContext) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text("Edit"),
                          onTap: () {
                            Navigator.of(sheetContext).pop();
                            _showEditDialog(context, index, task);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text("Delete"),
                          onTap: () {
                            Navigator.of(sheetContext).pop();
                            _showDeleteDialog(context, index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}



