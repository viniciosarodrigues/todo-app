import 'package:estudo_mobx/stores/todo_store.dart';
import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";

  @action
  void setNewToDoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isValidForm => newTodoTitle.isNotEmpty;

  ObservableList<ToDoStore> listItems = ObservableList<ToDoStore>();

  @action
  void addItem() {
    listItems.insert(0, ToDoStore(newTodoTitle));
  }
}
