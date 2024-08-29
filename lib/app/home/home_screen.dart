import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/utils/images.dart';
import 'package:pranermart/widgets/category.dart';
import 'package:pranermart/widgets/contact_ui.dart';
import 'package:pranermart/widgets/custom_slider.dart';
import 'package:pranermart/widgets/search_bar.dart';
import 'package:pranermart/widgets/search_dialog.dart';
import 'package:pranermart/widgets/single_product.dart';
import 'package:pranermart/widgets/text_icon_widgets.dart';

import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SearchDialog());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.6),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSlider(),
            CustomSearchBar(
              ontap: () {
                controller.SearchItemDialog(context);
              },
            ),
            SizedBox(height: 20),
            CustomTextIcon(
              text: "Category",
              icon: Icons.arrow_forward,
            ),
            Category(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleProduct(),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Wrap(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/applogo.png",
                                height: h / 7,
                              ),
                              Expanded(
                                child: Text(
                                  "Welcome to PranerMart - Your Ultimate Shopping Destination in Bangladesh!",
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Payment Method",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (int i = 0; i < AppImagas.length; i++)
                              Image.asset(
                                AppImagas[i],
                                height: 60,
                              )
                          ],
                        ),
                        Text(
                          "Follow Us",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Contact_mobile()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      drawer: CustomDrawer(),
    );
  }
}
