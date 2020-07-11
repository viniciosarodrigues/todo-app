import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

class ToDoStore = _ToDoStoreBase with _$ToDoStore;

abstract class _ToDoStoreBase with Store {
  _ToDoStoreBase(this.title);

  final String title;

  @observable
  bool done = false;

  @action
  void toggleDone() => done = !done;
}
