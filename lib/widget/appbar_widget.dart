import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String _title;
  final BuildContext _context;

  AppBarCustom(this._title, this._context);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Builder(
      builder: (context) => IconButton(
        color: Colors.red,
        icon: new Icon(Icons.menu_outlined),
        onPressed: () => Scaffold.of(this._context).openDrawer(),
      ),
    ));
  }
}
