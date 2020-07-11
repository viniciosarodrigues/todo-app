import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";

  ObservableList<String> listItems = ObservableList<String>();

  @action
  void setNewToDoTitle(String value) => newTodoTitle = value;

  @action
  void addItem() {
    listItems.add(newTodoTitle);
    newTodoTitle = "";
  }

  @computed
  bool get isValidForm => newTodoTitle.isNotEmpty;
}
