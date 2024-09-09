import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/product/details_screen.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.8),
                itemBuilder: (_, index) {
                  final data = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      Get.to(Details_Screen(data: data));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CachedNetworkImage(
                            height: 100,
                            fit: BoxFit.cover,
                            imageUrl: data["image"],
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Text(
                            data["name"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "৳ ${data['price']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "৳ ${data['discount_price']}",
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
