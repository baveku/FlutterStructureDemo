import 'package:flutter/material.dart';
import 'package:piano_dem_hat/screens/library/index.dart';
import 'package:piano_dem_hat/screens/news/index.dart';
import 'package:piano_dem_hat/screens/profile/index.dart';
import 'package:piano_dem_hat/screens/store/index.dart';

class HomeTabbarController extends StatefulWidget {
  @override
  _HomeTabbarControllerState createState() => _HomeTabbarControllerState();
}

class _HomeTabbarControllerState extends State<HomeTabbarController>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _screens = [
    NewsScreen(),
    LibraryScreen(),
    StoreScreen(),
    ProfileScreen(),
  ];

  int _currentTab = 0;

  List<BottomNavigationBarItem> _tabItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_balance_wallet,
      ),
      title: Text("News"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text("Library"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text("Store"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarms),
      title: Text("Profile"),
    ),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: _screens.length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _mainTabbar();
  }

  Widget _bottomTabbar() {
    return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[900],
              selectedItemColor: Colors.orangeAccent,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: true,
              currentIndex: _currentTab,
              items: _tabItems,
              onTap: (nextTab) => {
                    this.setState(() {
                      _currentTab = nextTab;
                    }),
                    _tabController.animateTo(nextTab)
                  },
            );
  }

  Widget _mainTabbar() {
    return Scaffold(
        bottomNavigationBar: _bottomTabbar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: _screens,
        ));
  }
}
