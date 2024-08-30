import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/home/widgets/home_appbar.dart';
import 'package:pranermart/app/category/category.dart';
import 'package:pranermart/app/slider/custom_slider.dart';
import 'package:pranermart/widgets/footter_section.dart';
import 'package:pranermart/widgets/search_bar.dart';
import 'package:pranermart/widgets/search_dialog.dart';
import 'package:pranermart/app/single_product/single_product.dart';
import 'package:pranermart/widgets/text_icon_widgets.dart';
import '../../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SearchDialog());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppbar(
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Silders...
            CustomSlider(),

            ///Search Products...
            CustomSearchBar(
              ontap: () {
                controller.SearchItemDialog(context);
              },
            ),
            SizedBox(height: 20),

            ///Category section...
            CustomTextIcon(
              text: "Category",
              text2: 'See Alll',
            ),
            SizedBox(height: 20),

            ///All Products...
            Category(),
            SizedBox(height: 20),
            CustomTextIcon(
              text: "Best Selling",
            ),
            SizedBox(height: 20),
            SingleProduct(),
            SizedBox(height: 20),

            ///Homepage Footter...
            FootterSection()
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
