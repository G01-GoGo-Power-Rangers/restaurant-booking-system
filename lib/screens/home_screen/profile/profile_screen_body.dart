import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

class ProfileScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel =
        Provider.of<HomeScreenViewModel>(context);
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Ink(
                height: size.height * 0.2 - 27,
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
                        '${loginViewModel.username}',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        backgroundImage: NetworkImage(
                          '${loginViewModel.user.photo}',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.red,
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.red, width: 2.0),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(230.0, 50.0),
            ),
            child: Text(
              'Log out',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              homeScreenViewModel.selectedIndex = 0;
              loginViewModel.onTapLogOut(context);
            },
          ),
        )
      ],
    );
  }
}
