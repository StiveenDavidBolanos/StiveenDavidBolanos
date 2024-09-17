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
      icon: Icons.credit_card),
  const MenuItems(
      title: 'Progres Indicators',
      subtitle: 'Generales y controlados',
      url: '/progress',
      icon: Icons.refresh_rounded),
  const MenuItems(
      title: 'Snackbars and Dialogs',
      subtitle: 'Indicadores en pantalla',
      url: '/snackbar',
      icon: Icons.info_outline_rounded),
  const MenuItems(
      title: 'Animated Container',
      subtitle: 'Animado',
      url: '/animated',
      icon: Icons.gif_box),
  const MenuItems(
      title: 'UI Controls',
      subtitle: 'Controles de Interfaz',
      url: '/uicontrol',
      icon: Icons.pest_control_rodent_rounded),
  const MenuItems(
      title: 'Tutorial',
      subtitle: 'Controles de Interfaz',
      url: '/tutorial',
      icon: Icons.how_to_reg_sharp),
];
