import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.jpg',
            semanticLabel: 'Umie Ju Corner Logo',
            height: 170.0,
          ),
          const SizedBox(height: 50),
          Container(
            child: Text(
              'Umie Ju Corner',
              style: TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColorDarker,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(230.0, 50.0),
              textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            child: Text('LOGIN'),
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
          const SizedBox(height: 40),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: kPrimaryColorDarker,
              backgroundColor: Colors.white,
              side: BorderSide(color: kPrimaryColorDarker, width: 2.0),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(230.0, 50.0),
              textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            child: Text('REGISTER'),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
          const SizedBox(height: 40),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: kPrimaryColorDarker,
              backgroundColor: Colors.white,
              side: BorderSide(color: kPrimaryColorDarker, width: 2.0),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(230.0, 50.0),
              textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            child: Text('MENU'),
            onPressed: () => Navigator.pushNamed(context, '/menu'),
          ),
        ],
      ),
    );
  }
}
