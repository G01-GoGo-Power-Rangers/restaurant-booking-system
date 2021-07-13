<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';
import 'package:restaurant_booking_system/router.dart';
import 'package:restaurant_booking_system/viewmodels/register_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/view_menu_view_model.dart';

import 'dependencies.dart' as di;

void main() {
  di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => BookingListViewModel()),
      ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ChangeNotifierProvider(create: (_) => ViewMenuViewModel()),
      ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
    ],
    child: MyApp(),
  ));
  // runApp(MyApp());
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
>>>>>>> 6650c59c6035b594b6e0bcce9c7847415aa73ca3
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Booking System',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      onGenerateRoute: createRoute,
      initialRoute: '/',
    );
=======
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper());
>>>>>>> 6650c59c6035b594b6e0bcce9c7847415aa73ca3
  }
}
