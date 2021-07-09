import 'package:flutter/material.dart';

class BookingDetailsBody extends StatelessWidget {
  BookingDetailsBody({Key key}) : super(key: key);

  // final List<String> details = [
  //   'Arif Masyhur',
  //   'Date: 6/9/2021',
  //   'Time: 12.00pm',
  //   'Table No: A3'
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
        title: Text('Arif Masyhur'),
      ),
      ListTile(
        title: Text('Date: 6/9/2021'),
      ),
      ListTile(
        title: Text('Time: 12.00pm'),
      ),
      ListTile(
        title: Text('Table No: A3'),
      )
    ]);
  }
}
