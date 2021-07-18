import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/models/order.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

class BookingDetailsBody extends StatelessWidget {
  final Booking _booking;

  BookingDetailsBody({Booking booking}) : _booking = booking;

  Booking get booking => _booking;

  // @override
  @override
  Widget build(BuildContext context) {
    BookingListViewModel _bookingListViewModel =
        Provider.of<BookingListViewModel>(context);

    return FutureBuilder<Order>(
      future: _bookingListViewModel.getCustomerBookingByBookingId(booking.id),
      builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.person_rounded),
                  title: Text('${booking.customername}',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.calendar_today_rounded),
                  title: Text('Date: ${booking.date}\nTime: ${booking.time}',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.table_chart_rounded),
                  title: Text('Table No: ${booking.table}',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.attach_money_rounded),
                  // title: Text(
                  //     'Total Price: RM${(booking.price + snapshot.data.totalPrice).ro}',
                  title: Text(
                      'Total Price: RM ${(booking.price + snapshot.data.totalPrice).toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.menu_book_rounded),
                  title: Text('Food List', style: TextStyle(fontSize: 20)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                        trailing: Text(
                            'X${snapshot.data.foods[index]['quantity']}',
                            style: TextStyle(fontSize: 20)),
                        title: Text('${snapshot.data.foods[index]['name']}',
                            style: TextStyle(fontSize: 20)),
                        subtitle: Text(
                            'Notes: ${snapshot.data.foods[index]['instruction'] != '' ? snapshot.data.foods[index]['instruction'] : 'None'}'),
                      ));
                    }),
              ),
              booking.status == 'processed'
                  ? ElevatedButton(
                      onPressed: () {
                        _bookingListViewModel.onTapConfirm(context, booking.id);
                        // print(booking.id);
                      },
                      child: Text('Done'),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColorDarker,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        // minimumSize: Size(230.0, 50.0),
                        minimumSize: Size(double.infinity, 50),
                        textStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  : const SizedBox(height: 5),
            ],
          );
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
