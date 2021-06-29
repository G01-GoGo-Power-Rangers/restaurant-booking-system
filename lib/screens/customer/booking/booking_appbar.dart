import 'package:flutter/material.dart';

class BookingScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingScreenAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
