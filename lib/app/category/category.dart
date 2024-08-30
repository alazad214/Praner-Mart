import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pranermart/app/category/utls/categories.dart';
import 'package:pranermart/app/product/product_page.dart';
import 'package:pranermart/utils/colors.dart';

class Category extends StatelessWidget {
  Category({super.key});

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
                      Image.asset(
                        categoriesImage[index],
                        height: 50,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        categories[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
