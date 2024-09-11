import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/style/toast_style.dart';

class CartController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  RxString selectedSize = RxString('');

  RxList sizes = [].obs;

  final user = FirebaseAuth.instance.currentUser;

  addToCart(QueryDocumentSnapshot product) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.email)
        .collection('cart')
        .add({
      'email': user!.email,
      'product_id': product.id,
      'name': product['name'],
      'price': product['discount_price'] ?? product['price'],
      'image': product['image'],
    }).then((value) {
      SuccessToast('Product successfully added to cart');
    });
  }
}
