import 'package:flutter/material.dart';

class FavioriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFF0F2027),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: _buildFavoritesList(),
    );
  }

  Widget _buildFavoritesList() {
    // Example list of favorite items
    final List<Map<String, String>> favoriteItems = [
      {
        'title': 'Product 1',
        'price': '\$120',
        'image': 'assets/images/product.png',
      },
      {
        'title': 'Product 2',
        'price': '\$80',
        'image': 'assets/images/product.png',
      },
      // Add more favorite items here
    ];

    if (favoriteItems.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final item = favoriteItems[index];
        return _buildFavoriteItem(item, context);
      },
    );
  }

  Widget _buildFavoriteItem(Map<String, String> item, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Image.asset(item['image']!,
            width: 80, height: 80, fit: BoxFit.cover),
        title:
            Text(item['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['price']!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                // Implement remove from favorites functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Implement view details functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          Text(
            'Add products to your favorites to see them here.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
