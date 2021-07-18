import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/menu_viewmodel.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    MenuViewModel _menuViewModel = Provider.of<MenuViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: SizedBox(
          height: 25,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                _buildCategory(_menuViewModel, index),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _menuViewModel.categories.length,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(MenuViewModel menuViewModel, int index) {
    return GestureDetector(
      onTap: () => menuViewModel.chooseCategory(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              menuViewModel.categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: menuViewModel.selectedIndex == index
                      ? Colors.black
                      : Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 25,
              color: menuViewModel.selectedIndex == index
                  ? Colors.black
                  : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
