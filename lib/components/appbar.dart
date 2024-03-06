import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Tasks"),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: const Icon(Icons.menu)
    );
  }
}
