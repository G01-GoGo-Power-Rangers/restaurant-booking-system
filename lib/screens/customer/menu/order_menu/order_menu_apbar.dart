import 'package:flutter/material.dart';

import '../../../../constant.dart';

class OrderMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Menu',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
