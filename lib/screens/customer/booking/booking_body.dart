import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/booking_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({Key key}) : super(key: key);
  @override
  _BookingBodyState createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  @override
  Widget build(BuildContext context) {
    BookingViewModel bookingViewModel = Provider.of<BookingViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 135.0),
                  child: Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3.0, bottom: 3.0, right: 0, left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            bookingViewModel.selectedDate,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          onTap: () {
                            bookingViewModel.selectDate(context);
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.calendar_today),
                            tooltip: 'Tap to choose a date',
                            onPressed: () {
                              bookingViewModel.selectDate(context);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3.0, bottom: 3.0, right: 0, left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            bookingViewModel.selectedTime,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          onTap: () {
                            bookingViewModel.selectTime(context);
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.access_time),
                            tooltip: 'Tap to choose a time',
                            onPressed: () {
                              bookingViewModel.selectTime(context);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Text(
            'Number of Persons',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          child: Slider(
            value: bookingViewModel.personSliderValue,
            min: 0,
            max: 12,
            divisions: 12,
            label: bookingViewModel.personSliderValue.round().toString(),
            onChanged: (double value) {
              bookingViewModel.personSliderValue = value;
            },
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ClipRRect(
              child: Image.asset('assets/images/table_select.jpg'),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            'Table',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black),
                  left: BorderSide(width: 1.0, color: Colors.black),
                  right: BorderSide(width: 1.0, color: Colors.black),
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      'Choose Table Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)),
                    ),
                    onTap: () {
                      bookingViewModel.selectDate(context);
                    },
                  ),
                  DropdownButton<String>(
                    value: bookingViewModel.tableBoxValue,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String newValue) {
                      bookingViewModel.tableBoxValue = newValue;
                    },
                    items: bookingViewModel.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Center(
            child: Consumer<LoginViewModel>(builder: (context, user, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColorDarker,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  minimumSize: Size(310.0, 35.0),
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                child: Text('CONFIRM'),
                onPressed: () {
                  bookingViewModel.setBooking(context, user.user);
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
