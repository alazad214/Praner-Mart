import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.horizontal,
        children: [],
      )),
      drawer: CustomDrawer(),
    );
  }
}
