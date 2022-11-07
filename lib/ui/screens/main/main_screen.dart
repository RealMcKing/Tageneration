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
      body: IndexedStack(
        index: model.selectedIndex,
        children: [
          screenFactory.makeProductList(),
          screenFactory.makeUser(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFF000000),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
          ),
        ),
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
    );
  }
}
