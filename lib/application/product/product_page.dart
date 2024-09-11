import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import 'product_details.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  ProductsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('$category Products')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: category)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('$category Products are out of stock'));
          } else {
            final products = snapshot.data!.docs;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return InkWell(
                  onTap: () =>
                      Get.to(() => ProductDetails(data: products[index])),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    padding:
                        EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          width: screenSize.width / 4,
                          fit: BoxFit.cover,
                          imageUrl: product['image'],
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "৳ ${product['price']}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  "৳ ${product['discount_price']}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${product['category']}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColor.yaleBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: AppColor.primary,
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      size: 16.0,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
