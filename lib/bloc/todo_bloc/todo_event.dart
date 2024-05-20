
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();
  @override
  List<Object> get props => [];

}

class AddEvent extends TodoEvent{
  final String task;
  const AddEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateEvent extends TodoEvent{
  final String task;
  final Object id;
  const UpdateEvent({required this.task, required this.id});
  @override
  List<Object> get props => [task,id];
}

class RemoveEvent extends TodoEvent{
  final Object id;
  const RemoveEvent({required this.id});
  @override
  List<Object> get props => [id];
}