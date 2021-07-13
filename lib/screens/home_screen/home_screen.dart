import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_bottomnav.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/widget/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => HomeScreen());

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel =
        Provider.of<HomeScreenViewModel>(context);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
              builder: (context) => IconButton(
                    color: Colors.red,
                    icon: new Icon(Icons.menu_outlined),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  )),
          backgroundColor: kPrimaryColorDark,
        ),
        body: homeScreenViewModel.pages
            .elementAt(homeScreenViewModel.selectedIndex),
        bottomNavigationBar: HomeBottomNav(
          homeScreenViewModel: homeScreenViewModel,
        ),
        drawer: DrawerCustom(''),
      ),
    );
  }
}
