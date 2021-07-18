import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            return Container(
              padding: EdgeInsets.only(top: 10),
              child: TabBarView(
                children: <Widget>[
                  Container(
                      child: ListView.separated(
                    itemCount: snapshot.data[0].length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/bookdetails',
                                  arguments: snapshot.data[0][index]);
                            },
                            child: ListTile(
                              title: Text(
                                'Customer Name: ${snapshot.data[0][index].customername}',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                'Date: ${snapshot.data[0][index].date}\nTime: ${snapshot.data[0][index].time}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(thickness: 2),
                  )),
                  Container(
                      child: ListView.separated(
                    itemCount: snapshot.data[1].length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/bookdetails',
                                  arguments: snapshot.data[1][index]);
                            },
                            child: ListTile(
                              title: Text(
                                'Customer Name: ${snapshot.data[1][index].customername}',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                'Date: ${snapshot.data[1][index].date}\nTime: ${snapshot.data[1][index].time}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 2,
                    ),
                  )),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
