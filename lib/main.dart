import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FocusNode focusNode = new FocusNode();
  final scafoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar =
        new SnackBar(content: Text('Email : $_email, password : $_password '));
    scafoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scafoldKey,
        appBar: AppBar(
          title: Text('Login Demo'),
          centerTitle: true,
        ),
        body: new Padding(
          padding: EdgeInsets.all(20.0),
          child: new Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (val) =>
                        !val.contains("@") ? 'Invalid Email' : null,
                    onSaved: (val) => _email = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "password"),
                    validator: (val) =>
                        val.length < 8 ? 'password too short' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text('Login'),
                  )
                ],
              )),
        ),
        // body: Container(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Column(
        //     children: <Widget>[
        //       new TextField(
        //         autofocus: true,
        //       ),
        //       new TextField(
        //         focusNode: focusNode,
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: new FloatingActionButton(
        //   onPressed: () => FocusScope.of(context).requestFocus(focusNode),
        //   child: new Icon(Icons.add),
        // ),
      ),
    );
  }
}
