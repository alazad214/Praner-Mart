import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pranermart/app/product/product_page.dart';
import 'package:pranermart/utils/colors.dart';

class Category extends StatelessWidget {
  Category({super.key});
  final List<String> categories = ['Electronics', 'Fashion', 'Books', 'Toys'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () =>
                  Get.to(() => ProductsPage(category: categories[index])),
              child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: 120,
                  width: 110,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CachedNetworkImage(
                        height: 70,
                        width: 90,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/curious-athlete-417715.appspot.com/o/products%2Fheadphone.jpg?alt=media&token=cf3df6ef-581d-479e-8798-1978adf12c2c",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        categories[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
