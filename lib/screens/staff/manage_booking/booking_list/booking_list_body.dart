import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_screen.dart';
// import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

class BookingListBody extends StatelessWidget {
  const BookingListBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingListViewModel bookingListViewModel =
        Provider.of<BookingListViewModel>(context);

    return FutureBuilder(
        future: Future.wait([
          bookingListViewModel.getNewBookingList(),
          bookingListViewModel.getHistoryBookingList()
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return TabBarView(
              children: <Widget>[
                Container(
                    child: ListView.separated(
                  itemCount: snapshot.data[0].length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                BookingDetailsScreen.route(
                                    isEditing: true,
                                    data: snapshot.data[0][index]));
                          },
                          child: ListTile(
                            title: Text(
                                'Customer Name: ${snapshot.data[0][index].customername}'),
                            subtitle: Text(
                                'Date: ${snapshot.data[0][index].date}\nTime: ${snapshot.data[0][index].time}'),
                          )),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
                Container(
                    child: ListView.separated(
                  itemCount: snapshot.data[1].length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                                'Customer Name: ${snapshot.data[1][index].customername}'),
                            subtitle: Text(
                                'Date: ${snapshot.data[1][index].date}\nTime: ${snapshot.data[1][index].time}'),
                          )),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
