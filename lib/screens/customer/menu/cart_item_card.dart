import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final dynamic _food;

  const CartItemCard({food}) : _food = food;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: AspectRatio(
            aspectRatio: 3.7,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "${_food['name']} \t\t x${_food['quantity']}",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: "RM ${_food['price'].toStringAsFixed(2)}",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Instruction: ${_food['instruction'] == '' ? 'None' : _food['instruction']}",
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        )
      ],
    );
  }
}
