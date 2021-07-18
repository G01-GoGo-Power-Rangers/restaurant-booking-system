import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/menu_viewmodel.dart';

import '../../../../constant.dart';
import '../food_card.dart';
import '../menu_categories.dart';

class OrderMenuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MenuViewModel _menuViewModel = Provider.of<MenuViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _menuViewModel.foodListFiltered == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: kPrimaryColorDarker,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'Loading....',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    itemCount: _menuViewModel.foodListFiltered.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => FoodCard(
                      food: _menuViewModel.foodListFiltered[index],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
