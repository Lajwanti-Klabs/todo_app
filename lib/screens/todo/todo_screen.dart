import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/todo/components/todo_body.dart';

import '../../bloc/todo_bloc/todo_bloc.dart';
import '../../bloc/todo_bloc/todo_event.dart';
import '../../bloc/todo_bloc/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoBloc todoBloc;
  TextEditingController taskController = TextEditingController();
  @override
  void initState() {
    todoBloc = TodoBloc();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    todoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => todoBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          centerTitle: true,
        ),
        body: TodoBody(taskController: taskController,),
        floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
          buildWhen: (current, previous) => false,
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context
                    .read<TodoBloc>()
                    .add(AddEvent(task: "Task : ${taskController.text}"));
                taskController.clear();

              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}


