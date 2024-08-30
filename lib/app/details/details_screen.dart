import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';

class Details_Screen extends StatelessWidget {
  final data;
  Details_Screen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: CachedNetworkImage(
              imageUrl: data["image"],
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "৳ ${data['price']}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Text(
                  "৳ ${data['discount_price']}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              data?["description"] ?? '',
              style: TextStyle(
                  color: Colors.white60.withOpacity(0.5), fontSize: 16),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    ontap: () {
                      Get.snackbar("Success", "Added to cart!",
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    text: "Add to Cart",
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CustomButton(
                    ontap: () {},
                    text: "Buy Now",
                  ))
                ],
              ))
        ],
      )),
    );
  }
}
