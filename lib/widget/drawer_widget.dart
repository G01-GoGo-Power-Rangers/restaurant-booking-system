import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

class DrawerCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  final String activeOne;
  final List<Map<String, String>> listNamesRoutes = [
    {'title': 'Home', 'route': 'home'},
    {'title': 'Booking page', 'route': 'booking'},
    {'title': 'Log out', 'route': 'logout'}
  ];

  DrawerCustom(this.activeOne);
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundImage: AssetImage('assets/images/unknown_user.png')),
            SizedBox(height: 20),
            Consumer<LoginViewModel>(
              builder: (_, bar, __) =>
                  Text('Hi ${loginViewModel.user.username}'),
            ),
            Divider()
          ],
        ),
      ),
      for (var item in listNamesRoutes)
        ListTile(
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              item['title'],
              style: item['route'] == this.activeOne
                  ? TextStyle(color: Colors.red)
                  : null,
            ),
            Divider()
          ]),
          onTap: () => Navigator.pushNamed(context, '/${item['route']}'),
        ),
    ]));
  }
}
