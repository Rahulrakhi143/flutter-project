import 'package:flutter/material.dart';

class Mypopupmenuitem extends PopupMenuItem<dynamic> {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int Values;
  Mypopupmenuitem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.Values
  }) : super(
    value: Values,
    child: ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    ),
  );
}
