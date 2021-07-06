import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_booking_system/constant.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({Key key}) : super(key: key);
  @override
  _BookingBodyState createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  String _selectedDate = 'Choose a date';
  String _selectedTime = 'Choose a time';
  String _tableBoxValue = '1';
  double _personSliderValue = 1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2042),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay d = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (d != null)
      setState(() {
        _selectedTime = d.format(context);
      });
  }

  @override
  Widget build(BuildContext context) {
    // BookingViewModel _bookingViewModel = Provider.of<BookingViewModel>(context);

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
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            _selectedDate,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.calendar_today),
                            tooltip: 'Tap to choose a date',
                            onPressed: () {
                              _selectDate(context);
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
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            _selectedTime,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          onTap: () {
                            _selectTime(context);
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.access_time),
                            tooltip: 'Tap to choose a time',
                            onPressed: () {
                              _selectTime(context);
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
            value: _personSliderValue,
            min: 0,
            max: 12,
            divisions: 12,
            label: _personSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _personSliderValue = value;
              });
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
                      _selectDate(context);
                    },
                  ),
                  DropdownButton<String>(
                    value: _tableBoxValue,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String newValue) {
                      setState(() {
                        _tableBoxValue = newValue;
                      });
                    },
                    items: <String>[
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
                    ].map<DropdownMenuItem<String>>((String value) {
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColorDarker,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                minimumSize: Size(310.0, 35.0),
                textStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              child: Text('CONFIRM'),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
