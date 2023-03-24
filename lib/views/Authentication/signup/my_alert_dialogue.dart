import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('My Alert Dialog'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter some text',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onSaved: (value) {
            _textFieldValue = value??"";
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              print('Text field value: $_textFieldValue');
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
