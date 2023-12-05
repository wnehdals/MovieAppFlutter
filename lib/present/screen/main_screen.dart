import 'package:first_flutter/present/layout/default_layout.dart';
import 'package:first_flutter/present/res/colors.dart';
import 'package:first_flutter/present/screen/favorite_screen.dart';
import 'package:first_flutter/present/screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../res/strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  List<String> titles = [Strings.LIST, Strings.FAVORITE];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(tabListener);
  }
  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }
  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: titles[index],
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            SearchScreen(),
            FavoriteScreen()
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ContextColors.black,
        unselectedItemColor: ContextColors.gray300,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: Strings.LIST
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Strings.FAVORITE
          ),
        ],
      ),
    );
  }
}