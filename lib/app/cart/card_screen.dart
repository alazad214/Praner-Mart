import 'package:flutter/material.dart';
import 'package:pranermart/app/cart/widgets/cart_fotter.dart';
import 'package:pranermart/app/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  for (int i = 0; i < 10; i++)
                    CartItem(
                      title: "A4 Tech Headphone",
                      count: "2",
                      price: "200",
                    ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: CartFotter());
  }
}
