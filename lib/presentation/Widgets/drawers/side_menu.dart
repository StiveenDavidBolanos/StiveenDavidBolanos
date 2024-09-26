import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.scaffoldkey});
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int indxDrawerNavigation = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;
    return NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            indxDrawerNavigation = value;
          });

          final MenuItems itemSelected = appMenuItems[value];
          context.push(itemSelected.url);

          widget.scaffoldkey.currentState?.closeDrawer();
        },
        selectedIndex: indxDrawerNavigation,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 20, 20),
            child: const Text('Menu'),
          ),
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 10, 28),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 20, 20),
            child: Text('More options'),
          ),
          ...appMenuItems.sublist(4).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}
