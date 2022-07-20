import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logistic/ui/screens/orders/my_orders.dart';
import 'package:logistic/ui/screens/notification.dart';
import 'package:logistic/ui/screens/profile/my_profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
       MyOrders(),
       NotificationScreen(),
       Placeholder(),
       MyProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'home'.tr,
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.notifications,
        ),
        title: 'notifications'.tr,
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.help,
        ),
        title: 'help'.tr,
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: 'myAccount'.tr,
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).hintColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.grey.shade50,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }
}
