import 'package:flutter/material.dart';

Future<String> showSimpleTextInputDialog(BuildContext context, final String title) {
  String result = "";

  return showDialog<String>(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(title),
            content: TextField(
              onChanged: (value) => result = value,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(result),
              )
            ],
          )
  );
}
