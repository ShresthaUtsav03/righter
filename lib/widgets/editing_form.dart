import 'package:flutter/material.dart';
import 'package:righter/widgets/customTextField.dart';

class SettingsForm extends StatefulWidget {
  final String username;
  SettingsForm(this.username);
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Customtextfield(
            validateFunction: (val) =>
                val.isEmpty ? 'Please enter a name' : null,
            changeFunction: (val) => setState(() => _currentName = val),
          ),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
              }),
        ],
      ),
    );
  }
}
