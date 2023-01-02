import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

import 'bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int _currentIndex = 0;
  bool _isHome = true;
  late List<Widget> _tabScreens;

  @override
  void initState() {
    super.initState();

    _tabScreens = allBottomBarItems
        .map((e) => e.toScreen(
              onNavigateToTab: (
                BottomBar tab, {
                Map<String, dynamic> params = const {},
              }) {},
            ))
        .toList();

    WidgetsBinding.instance.addObserver(this);
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: IndexedStack(
        index: _currentIndex,
        children: _tabScreens,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _buildBody(),
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: context.primaryColor.withOpacity(.1)),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: context.borderColor),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            items: allBottomBarItems
                .map((e) => e.toNavigationBarItem(context, _isHome))
                .toList(),
            currentIndex: _currentIndex,
            backgroundColor: _isHome ? context.darkColor : context.lightColor,
            unselectedItemColor:
                _isHome ? context.lightColor : context.borderHoverColor,
            selectedItemColor: _isHome ? context.lightColor : context.darkColor,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _isHome = index == 0;
              });
            },
          ),
        ),
      ),
    );
  }
}
