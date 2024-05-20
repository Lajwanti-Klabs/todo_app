import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo_bloc/todo_bloc.dart';
import '../../../bloc/todo_bloc/todo_event.dart';
import '../../../bloc/todo_bloc/todo_state.dart';
import '../../../components/show_alert/show_alert.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({super.key,required this.taskController});
 final TextEditingController taskController;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        TextField(
          controller: taskController,
          decoration: const InputDecoration(
              hintText: "Add a task",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo, width: 2.0),
              )),
        ),
        const SizedBox(
          height: 50,
        ),
        BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("No todo found!"),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todoList[index]),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            showAlert(context, state.todoList[index], state.todoList[index]);
                          },
                          child: const Icon(Icons.edit)),
                      InkWell(
                          onTap: () {
                            context.read<TodoBloc>().add(
                                RemoveEvent(id: state.todoList[index]));
                          },
                          child: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
