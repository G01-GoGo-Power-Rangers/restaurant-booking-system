import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'user_booking_list_body.dart';

class UserBookingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: kPrimaryColorDark,
      ),
      body: UserBookingListBody(),
    );
  }
}
