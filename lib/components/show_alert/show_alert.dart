import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_bloc/todo_bloc.dart';
import '../../bloc/todo_bloc/todo_event.dart';

void showAlert(BuildContext context,String txt,Object id) {
  TextEditingController controller = TextEditingController();
  controller.text = txt.toString();
  return showAboutDialog(
    children: [
      TextField(
        controller: controller,
        decoration: const InputDecoration(
            hintText: "Update a task",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 2.0),
            )),
      ),
      const SizedBox(
        height: 50,
      ),
      FloatingActionButton(
        onPressed: () {
          context
              .read<TodoBloc>()
              .add(UpdateEvent(
              id: id,
              task: controller.text));
          controller.clear();
          Navigator.pop(context);
        },
        child: const Text("Update"),
      )
    ],
    context: context,
  );
}