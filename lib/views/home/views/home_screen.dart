import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/footter_section.dart';
import 'package:pranermart/widgets/search_bar.dart';
import 'package:pranermart/widgets/search_dialog.dart';
import 'package:pranermart/widgets/text_icon_widgets.dart';
import '../../drawer/custom_drawer.dart';
import '../../product/category.dart';
import '../../product/single_product.dart';
import '../../slider/custom_slider.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(SearchDialog());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future refreshHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: HomeAppbar(
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      body: RefreshIndicator(
        onRefresh: refreshHomeScreen,
        backgroundColor: AppColor.primary,
        color: Colors.black,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ///HomeScreen Silders
              CustomSlider(),

              /// Search Products
              CustomSearchBar(
                ontap: () {
                  controller.SearchItemDialog(context);
                },
              ),
              SizedBox(height: 20),

              /// Category section...
              CustomTextIcon(
                text: "Category",
                text2: 'See Alll',
              ),
              SizedBox(height: 20),

              /// All Products...
              Category(),
              SizedBox(height: 20),

              /// Best Selling Products...
              CustomTextIcon(
                text: "Best Selling",
              ),
              SizedBox(height: 20),

              /// SingleProduct (with RefreshIndicator)
              SingleProduct(),
              SizedBox(height: 20),

              /// Homepage Footer...
              FootterSection(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
