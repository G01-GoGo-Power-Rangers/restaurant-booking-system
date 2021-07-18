import 'package:flutter/material.dart';

import '../../../../constant.dart';

class OrderMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Order Menu',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: kPrimaryColor,
      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/cart'),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ),
        const SizedBox(
          width: 17,
        ),
      ],
    );
  }
}
