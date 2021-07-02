import 'package:flutter/material.dart';

class BookingListBody extends StatelessWidget {
  const BookingListBody({
    Key key,
    @required this.containers,
  }) : super(key: key);

  final List<Widget> containers;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: containers,
    );
  }
}
