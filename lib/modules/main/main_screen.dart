import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/blocs/mixins/mixins.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/modules/common/authentication_drawer/authentication_drawer.dart';
import 'package:tiktok/modules/video_creation/video_creation_screen.dart';
import 'package:tiktok/widgets/widgets.dart';

import 'bottom_bar.dart';
import 'video_creation_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with WidgetsBindingObserver, SessionData {
  int _currentIndex = 0;
  bool _isHome = true;
  late List<Widget> _tabScreens;

  @override
  void initState() {
    super.initState();

    _tabScreens = [
      ...BottomBarPosition.left.bottomBarItems.map((e) => e.toScreen(
            onNavigateToTab: (
              BottomBar tab, {
              Map<String, dynamic> params = const {},
            }) {},
          )),
      const VideoCreationScreen(),
      ...BottomBarPosition.right.bottomBarItems.map((e) => e.toScreen(
            onNavigateToTab: (
              BottomBar tab, {
              Map<String, dynamic> params = const {},
            }) {},
          )),
    ];

    WidgetsBinding.instance.addObserver(this);
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return IndexedStack(
            index: _currentIndex,
            children: _tabScreens,
          );
        },
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
            items: [
              ...BottomBarPosition.left.bottomBarItems
                  .map((e) => e.toNavigationBarItem(context, _isHome)),
              const BottomNavigationBarItem(
                icon: VideoCreationIcon(),
                label: '',
              ),
              ...BottomBarPosition.right.bottomBarItems
                  .map((e) => e.toNavigationBarItem(context, _isHome))
            ],
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
            onTap: (index) async {
              if (_tabScreens[index] is VideoCreationScreen) {
                if (currentUser != null) {
                  AppRouting().pushNamed(context, Screens.videoCreation.toName);
                } else {
                  await BottomDrawer.of(context)
                      .standard(
                        padding: const EdgeInsets.all(0),
                        child: const AuthenticationDrawer(),
                      )
                      .show();
                }
              } else {
                setState(() {
                  _currentIndex = index;
                  _isHome = index == 0;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
