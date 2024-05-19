import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.withOpacity(0.6),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: CarouselSlider.builder(
          itemCount: 5,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            height: 150,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return CachedNetworkImage(
              height: 140,
              fit: BoxFit.cover,
              imageUrl:
                  "https://www.thestatesman.com/wp-content/uploads/2019/03/e-comm.jpg",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          }),
    );
  }
}
