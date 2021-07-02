import 'package:flutter/material.dart';

class BookingListBody extends StatelessWidget {
  //final List items;
  //BookingListBody(this.items);
  final staff = List<String>.generate(4, (i) => 'Staff 1 #${i + 1}');
  final List<Widget> listview = [
    Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('arif'), subtitle: Text('Staff ${index + 1}')),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 2),
    ),
    Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('Hasan'), subtitle: Text('Staff ${index + 1}')),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 2),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: TabBarView(
          children: listview,
        ));
  }
}
