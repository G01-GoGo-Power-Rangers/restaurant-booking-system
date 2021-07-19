import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

import '../../../constant.dart';

class UserBookingListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    HomeScreenViewModel _homeScreenViewModel =
        Provider.of<HomeScreenViewModel>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                // top: 10,
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
        FutureBuilder<List<Booking>>(
            future: _homeScreenViewModel
                .getUserBookingList(_homeScreenViewModel.user.id),
            builder:
                (BuildContext context, AsyncSnapshot<List<Booking>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.check_circle_outline_outlined,
                            size: 40,
                            color: Colors.green,
                          ),
                          title: Text(
                            'Date: ${snapshot.data[index].date}',
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text('Date: ${snapshot.data[index].date}'),
                        ),
                      );
                    });
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ],
    );
  }
}
