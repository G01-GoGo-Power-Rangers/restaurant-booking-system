import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/view_menu_view_model.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    ViewMenuViewModel vMenuViewModel = Provider.of<ViewMenuViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: SizedBox(
          height: 25,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                _buildCategory(vMenuViewModel, index),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vMenuViewModel.categories.length,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(ViewMenuViewModel vMenuViewModel, int index) {
    return GestureDetector(
      onTap: () => vMenuViewModel.chooseCategory(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              vMenuViewModel.categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: vMenuViewModel.selectedIndex == index
                      ? Colors.black
                      : Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 25,
              color: vMenuViewModel.selectedIndex == index
                  ? Colors.black
                  : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
