import 'package:flutter/material.dart';
import 'package:pranermart/app/cart/widgets/cart_fotter.dart';
import 'package:pranermart/app/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              CartItem(
                title: "A4 Tech Headphone",
                count: "2",
                price: "200",
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: CartFotter()),

            ],
          ),
        ),
      ),
     
    );
  }
}
