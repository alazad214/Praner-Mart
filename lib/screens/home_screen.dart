import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pranermart/widgets/category.dart';
import 'package:pranermart/widgets/custom_slider.dart';
import 'package:pranermart/widgets/custom_textField.dart';
import 'package:pranermart/widgets/search_bar.dart';
import 'package:pranermart/widgets/text_icon_widgets.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.6),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSlider(),
              CustomSearchBar(),
              SizedBox(height: 20),
              CustomTextIcon(
                text: "Category",
                icon: Icons.arrow_forward,
              ),
              Category(),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Best Selling", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              )
            ],
          ),
        ),
      )),
      drawer: CustomDrawer(),
    );
  }
}
