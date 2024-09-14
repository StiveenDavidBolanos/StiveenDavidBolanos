import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}

List<MenuItems> appMenuItems = [
  const MenuItems(
      title: 'Buttons',
      subtitle: 'Many buttons',
      url: '/buttons',
      icon: Icons.smart_button_outlined),
  const MenuItems(
      title: 'Cards',
      subtitle: 'Stilized container',
      url: '/cards',
      icon: Icons.credit_card)
];
