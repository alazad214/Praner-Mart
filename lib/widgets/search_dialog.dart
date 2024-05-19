import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDialog extends GetxController{
  SearchItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('পণ্য খুঁজুন'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'পণ্যের নাম লিখুন',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Search button এর জন্য কার্যকলাপ

                // এখানে আপনি আপনার পণ্য খোঁজার কোড যোগ করবেন
                Navigator.of(context).pop();
              },
              child: Text('Search'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
