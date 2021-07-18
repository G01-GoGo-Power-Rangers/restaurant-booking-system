import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/booking_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

import '../../../constant.dart';

class UserBookingListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    BookingViewModel _bookingViewModel = Provider.of<BookingViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Ink(
                height: size.height * 0.128 - 27,
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
                  margin: EdgeInsets.only(left: 25, top: 0, right: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${loginViewModel.username}\'s Bookings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
