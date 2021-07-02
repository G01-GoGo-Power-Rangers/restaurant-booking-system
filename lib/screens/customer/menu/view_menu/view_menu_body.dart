import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/models/food.dart';
import 'package:restaurant_booking_system/screens/customer/menu/menu_categories.dart';
import 'package:restaurant_booking_system/viewmodels/view_menu_view_model.dart';

class ViewMenuBody extends StatelessWidget {
  const ViewMenuBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewMenuViewModel _viewMenuViewModel =
        Provider.of<ViewMenuViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _viewMenuViewModel.foodListFiltered == null
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
                    itemCount: _viewMenuViewModel.foodListFiltered.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => FoodCard(
                      food: _viewMenuViewModel.foodListFiltered[index],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard({this.food});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('click'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: 140,
            // width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 2),
              ],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.0, color: Colors.transparent),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/foodimage.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              food.foodname,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            'RM ${food.foodprice.toDouble().toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
