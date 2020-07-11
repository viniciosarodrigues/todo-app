import 'package:estudo_mobx/screens/list_screen.dart';
import 'package:estudo_mobx/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'custom_icon_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginStore loginStore = LoginStore();

  final FocusNode _userFocus = FocusNode();

  final FocusNode _passwordFocus = FocusNode();

  final FocusNode _loginButtonFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ListScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: TextFormField(
                    focusNode: _userFocus,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onChanged: loginStore.setuser,
                    enabled: !loginStore.loading,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _userFocus, _passwordFocus);
                    },
                    decoration: InputDecoration(
                      enabled: !loginStore.loading,
                      icon: Icon(Icons.account_circle),
                      hintText: 'Usuário',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(
              builder: (_) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: TextFormField(
                    onChanged: loginStore.setPassword,
                    enabled: loginStore.isValiduser,
                    obscureText: !loginStore.passwordVisible,
                    focusNode: _passwordFocus,
                    onFieldSubmitted: (term) {
                      loginStore.login();
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      enabled: loginStore.loading,
                      hintText: 'Senha',
                      suffix: CustomIconButton(
                        radius: 32,
                        iconData: !loginStore.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTap: loginStore.togglePasswordVisible,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(
              builder: (_) {
                return SizedBox(
                  height: 44,
                  child: RaisedButton(
                    focusNode: _loginButtonFocus,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: loginStore.loading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          )
                        : Text('Login'),
                    color: Theme.of(context).primaryColor,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    onPressed: loginStore.loginPressed,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
