import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/services/booking_service.dart';
import 'package:restaurant_booking_system/widget/custom_alert_dialog.dart';

import '../dependencies.dart';

class BookingViewModel extends ChangeNotifier {
  String _selectedDate = 'Choose a date';
  String _selectedTime = 'Choose a time';
  String _tableBoxValue = 'Choose';
  double _personSliderValue = 0;
  Booking _booking = Booking();

  List<String> items = [
    'Choose',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  final bookingService = service<BookingService>();

  get selectedDate => _selectedDate;

  get selectedTime => _selectedTime;

  Booking get booking => _booking;

  get tableBoxValue => _tableBoxValue;
  set tableBoxValue(value) {
    _tableBoxValue = value;
    notifyListeners();
  }

  get personSliderValue => _personSliderValue;
  set personSliderValue(value) {
    _personSliderValue = value;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2042),
    );
    if (d != null) _selectedDate = new DateFormat.yMd("en_US").format(d);
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay d = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (d != null) {
      _selectedTime = d.format(context);
      notifyListeners();
    }
  }

  double setBookingPrice(int person) {
    return person * 10.0;
  }

  setBooking(BuildContext context, User user) async {
    if (selectedDate == 'Choose a date' ||
        selectedTime == 'Choose a time' ||
        personSliderValue == 0 ||
        tableBoxValue == 'Choose') {
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
                title: 'Booking Information',
                content: 'Please complete the booking information',
                items: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'ok'),
                      child: Text('OK'))
                ],
              ));
    } else {
      booking.date = selectedDate.toString();
      booking.time = selectedTime.toString();
      booking.person = personSliderValue.toInt();
      booking.table = tableBoxValue;
      booking.price = setBookingPrice(personSliderValue.toInt());
      booking.status = 'processed';
      booking.userid = user.id;
      booking.customername = user.fullname;

      // final result = await bookingService.createNewBooking(booking);
      // _booking = result;
      // print(booking.customername);
      // print(booking.date);
      // print(booking.time);
      // print(booking.person);
      // print(booking.table);
      // print(booking.price);
      // print(booking.status);
      // print(booking.userid);
    }
  }
}
