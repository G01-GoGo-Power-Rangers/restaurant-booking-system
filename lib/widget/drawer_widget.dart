import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

import '../constant.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    final padding = EdgeInsets.symmetric(horizontal: 15);

    return Drawer(
      child: Material(
        color: kPrimaryColorDark,
        child: Consumer<BookingListViewModel>(
          builder: (_, bookingListViewModel, __) => ListView(
            padding: padding,
            children: [
              const SizedBox(height: 80),
              MenuItemHeader(user: loginViewModel.user),
              const SizedBox(height: 30),
              Divider(
                color: Colors.white,
                thickness: 2,
              ),
              const SizedBox(height: 10),
              MenuItem(
                text: 'Home',
                icon: Icons.home_rounded,
                onTap: () => bookingListViewModel.onTapHome(context),
              ),
              const SizedBox(height: 10),
              MenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onTap: () => bookingListViewModel.onTapLogOut(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemHeader extends StatelessWidget {
  final User _user;
  final color = Colors.white;

  MenuItemHeader({user}) : _user = user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              _user.photo,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_user.username,
                  style: TextStyle(fontSize: 20, color: color)),
              const SizedBox(
                height: 4,
              ),
              Text(_user.email, style: TextStyle(fontSize: 20, color: color))
            ],
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final Function _onTap;
  final color = Colors.white;

  MenuItem({text, icon, onTap})
      : _text = text,
        _icon = icon,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _icon,
        color: color,
        size: 30,
      ),
      title: Text(
        _text,
        style: TextStyle(fontSize: 20, color: color),
      ),
      onTap: _onTap,
    );
  }
}
