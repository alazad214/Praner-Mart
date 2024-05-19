import 'package:flutter/material.dart';
import 'package:pranermart/widgets/custom_slider.dart';
import 'package:pranermart/widgets/custom_textField.dart';
import 'package:pranermart/widgets/search_bar.dart';

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
            children: [CustomSlider(), CustomSearchBar()],
          ),
        ),
      )),
      drawer: CustomDrawer(),
    );
  }
}
