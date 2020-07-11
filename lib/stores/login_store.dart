import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print("Fomulário válido? :: " + isValidForm.toString());
    });
  }

  //
  //  Observable
  //

  @observable
  String user = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  //
  //  Action
  //

  @action
  void setuser(String value) => user = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loggedIn = true;
    loading = false;
  }

  //
  //  Computed
  //

  @computed
  Function get loginPressed => isValidForm && !loading ? login : null;

  @computed
  bool get isValidPassword => password.length >= 6;

  @computed
  bool get isValiduser => user.length > 1;

  @computed
  bool get isValidForm => isValiduser && isValidPassword;
}
