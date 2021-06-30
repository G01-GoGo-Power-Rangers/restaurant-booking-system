import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/view_menu_view_model.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewMenuViewModel viewMenuViewModel =
        Provider.of<ViewMenuViewModel>(context);

    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Ink(
            height: size.height * 0.4 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColorDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 20, right: 25),
              child: Row(
                children: [
                  Text(
                    'Hi, ${loginViewModel.username}!',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/fir-first-project-98a7e.appspot.com/o/profilepictest.jpg?alt=media&token=bdb0608d-86d9-460c-b6ea-33fa3fc5057d',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 0,
            right: 0,
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWellButton(
                      title: 'BOOK',
                      onTap: () {},
                    ),
                    InkWellButton(
                      title: 'MENU',
                      onTap: () {
                        viewMenuViewModel.getFoodList();
                        Navigator.pushNamed(context, '/menu');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InkWellButton extends StatelessWidget {
  final String title;
  final Function onTap;

  InkWellButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.all(0),
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          color: kPrimaryColorDarker,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 2),
          ],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1.0, color: kPrimaryColorDarker),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: titleFont),
        )),
      ),
    );
  }
}
