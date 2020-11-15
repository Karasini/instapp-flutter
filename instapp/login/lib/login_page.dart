import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'rest_client.dart';
import 'login_form_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
    VoidCallback onLoginSuccess
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  LoginFormModel model = LoginFormModel();

  Future<AuthToken> requestToken(String email, String password) async {
    final dio = Dio();   // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    final client = RestClient(dio);
    return await client.requestToken('password', 'client_mobile', email, password, 'instappApi offline_access openid');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(labelText: "email"),
              onSaved: (String value) {
                model.email = value;
              },
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(labelText: "password"),
              onSaved: (String value) {
                model.password = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    _formKey.currentState.save();
                    final result = await requestToken(model.email, model.password);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('${result.access_token}')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}