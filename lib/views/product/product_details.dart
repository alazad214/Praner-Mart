import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pranermart/business%20logic/controllers/cart_controller.dart';
import 'package:pranermart/style/text_style.dart';
import 'package:pranermart/utils/colors.dart';
import '../../widgets/small_button.dart';

class ProductDetails extends StatelessWidget {
  final product;
  ProductDetails({Key? key, required this.product}) : super(key: key);
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.cornsilk,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.heart,
                  color: Colors.red,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height / 4,
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: CachedNetworkImage(
                imageUrl: product["image"],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product["name"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle1(fontSize: 16.0)),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("৳ ${product['price']}",
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle1(
                                fontSize: 18.0, textColor: Colors.green)),
                      ),
                      Text(
                        "৳ ${product['discount_price']}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18),
                      )
                    ],
                  ),
                  Divider(),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Text(
                    product?["description"] ?? '',
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        )),

        ///Add to Cart Button...
        bottomSheet: Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0))),
          child: Row(
            children: [
              Expanded(
                child: SmallButton(
                  text: 'Add to cart',
                  bgcolor: AppColor.red,
                  ontap: () => controller.addToCart(product),
                ),
              ),
            ],
          ),
        ));
  }
}
