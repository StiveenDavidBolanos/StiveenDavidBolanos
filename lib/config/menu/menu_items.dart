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
      title: 'Misiones faltantes',
      subtitle: 'Cositas que tengo que hacer',
      url: '/uncompleted',
      icon: Icons.sms_failed_outlined),
  const MenuItems(
      title: 'Misiones completadas',
      subtitle: 'Misiones que he cumplido',
      url: '/completed',
      icon: Icons.star_border_rounded),
  const MenuItems(
      title: 'Lista de peliculas',
      subtitle: 'Peliculas vistas y por ver',
      url: '/movies',
      icon: Icons.movie_filter_outlined),
];
