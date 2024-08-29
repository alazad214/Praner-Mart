import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _buildCartItemsList()),
          _buildTotalPriceSection(context),
        ],
      ),
    );
  }

  Widget _buildCartItemsList() {

    final List<Map<String, dynamic>> cartItems = [
      {
        'title': 'Product 1',
        'price': 120,
        'quantity': 1,
        'image': 'assets/images/product.png',
      },
      {
        'title': 'Product 2',
        'price': 80,
        'quantity': 2,
        'image': 'assets/images/product.png',
      },
      // Add more cart items here
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return _buildCartItem(item, context);
      },
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              item['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('\$${item['price']}',
                      style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 8),
                  _buildQuantityControl(item),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Implement remove from cart functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl(Map<String, dynamic> item) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            // Implement decrease quantity functionality
          },
        ),
        Text(item['quantity'].toString(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            // Implement increase quantity functionality
          },
        ),
      ],
    );
  }

  Widget _buildTotalPriceSection(BuildContext context) {
    final double totalPrice = 280; // Example total price calculation

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 8.0,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implement checkout functionality
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Color(0xFF0F2027),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Proceed to Checkout', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
