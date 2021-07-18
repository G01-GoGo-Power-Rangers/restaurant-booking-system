import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String _title;
  final String _content;
  final List<Widget> _items;

  const CustomAlertDialog({title, content, List<Widget> items})
      : _title = title,
        _content = content,
        _items = items;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_content),
      actions: <Widget>[..._items],
    );
  }
}
