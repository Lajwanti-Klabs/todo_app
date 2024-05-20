
import 'package:bloc/bloc.dart';
import 'package:todo_app/bloc/todo_bloc/todo_event.dart';
import 'package:todo_app/bloc/todo_bloc/todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<String> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddEvent>(addEvent);
    on<UpdateEvent>(updateEvent);
    on<RemoveEvent>(deleteEvent);
  }
  void addEvent(AddEvent event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void updateEvent(UpdateEvent event, Emitter<TodoState> emit) {
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i] == event.id) {
        todoList[i] = event.task;
        emit(state.copyWith(todoList: List.from(todoList)));
      }
    }
  }

  void deleteEvent(RemoveEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.id);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
