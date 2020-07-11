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
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  //
  //  Action
  //

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

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
  bool get isValidEmail => email.length > 1;

  @computed
  bool get isValidForm => isValidEmail && isValidPassword;
}
