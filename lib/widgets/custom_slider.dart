import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                  "https://images.samsung.com/is/image/samsung/p6pim/bd/sm-a057flvhbkd/gallery/bd-galaxy-a05s-sm-a057-sm-a057flvhbkd-thumb-539556309?",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          }),
    );
  }
}
