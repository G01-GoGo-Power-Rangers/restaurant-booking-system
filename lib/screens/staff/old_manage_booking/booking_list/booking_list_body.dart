import 'package:flutter/material.dart';

import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

class BookingListBody extends StatefulWidget {
  @override
  _BookingListBodyState createState() => _BookingListBodyState();
}

class _BookingListBodyState extends State<BookingListBody> {
  //final List items;
  //BookingListBody(this.items);
  // BookingListViewModel viewmodel = service<BookingListViewModel>();

  @override
  void initState() {
    // viewmodel.getBookingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
    // return ChangeNotifierProvider<BookingListViewModel>(
    //   // 2
    //   create: (context) => viewmodel,
    //   // 3
    //   child: Consumer<BookingListViewModel>(
    //     builder: (context, model, child) => ListView.builder(
    //       itemCount: viewmodel.bookingList.length,
    //       itemBuilder: (context, index) {
    //         return Card(
    //           child: ListTile(
    //             title: Text('Person: ${viewmodel.bookingList[index].person}'),
    //             subtitle: Text(
    //                 'Date:${viewmodel.bookingList[index].date}\nTime:${viewmodel.bookingList[index].time}'),
    //             onTap: () {
    //               // 5
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
