import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOla'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final appMenuItem = appMenuItems[index];
        return _CustomListTile(
          item: appMenuItem,
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.item});
  final MenuItems item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
      iconColor: colors.primary,
      leading: Icon(item.icon),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      onTap: () {
        context.push(item.url);
      },
    );
  }
}
