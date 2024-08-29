import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderId: 'ORD123456',
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'Shipped',
      total: 99.99,
    ),
    Order(
      orderId: 'ORD789012',
      date: DateTime.now().subtract(Duration(days: 5)),
      status: 'Delivered',
      total: 49.49,
    ),
    Order(
      orderId: 'ORD345678',
      date: DateTime.now().subtract(Duration(days: 10)),
      status: 'Processing',
      total: 75.00,
    ),
    // Add more orders here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Color(0xFF0F2027),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return _buildOrderCard(context, order);
          },
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, Order order) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          'Order #${order.orderId}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: '),
            Text('Status: ${order.status}'),
            Text('Total: \$${order.total.toStringAsFixed(2)}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert, color: Color(0xFF203A43)),
          onPressed: () {
            _showOrderOptions(context, order);
          },
        ),
        onTap: () {
          // Navigate to order details screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(order: order),
            ),
          );
        },
      ),
    );
  }


  void _showOrderOptions(BuildContext context, Order order) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.track_changes, color: Color(0xFF203A43)),
                title: Text('Track Shipment'),
                onTap: () {
                  Navigator.of(context).pop();
                  _showTrackShipmentDialog(context, order);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.redAccent),
                title: Text('Cancel Order'),
                onTap: () {
                  Navigator.of(context).pop();
                  _showCancelOrderDialog(context, order);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTrackShipmentDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Track Shipment'),
          content: Text('Tracking information for Order #${order.orderId}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showCancelOrderDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content:
              Text('Are you sure you want to cancel Order #${order.orderId}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle order cancellation here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order #${order.orderId} canceled'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.orderId} Details'),
        backgroundColor: Color(0xFF0F2027),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Date: adsfj',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Status: ${order.status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Total Amount: \$${order.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            // List of items in the order
            // You can add a list of items here with their quantities and prices
          ],
        ),
      ),
    );
  }


}

class Order {
  final String orderId;
  final DateTime date;
  final String status;
  final double total;

  Order({
    required this.orderId,
    required this.date,
    required this.status,
    required this.total,
  });
}
