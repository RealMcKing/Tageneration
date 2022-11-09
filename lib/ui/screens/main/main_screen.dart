import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/main/main_model.dart';
import 'package:tageneration/domain/factory/screen_factory.dart';

class MainScreen extends StatelessWidget {
  static final screenFactory = ScreenFactory();

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: IndexedStack(
        index: model.selectedIndex,
        children: [
          screenFactory.makeProductList(),
          screenFactory.makeUser(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            currentIndex: model.selectedIndex,
            onTap: (index) => model.onItemTapped(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.archivebox_fill),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_solid),
                label: 'Me',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
