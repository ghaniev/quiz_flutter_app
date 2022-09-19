import 'package:flutter/material.dart';
import 'package:quiz_app/shared/shared.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,
          style: const TextStyle(
              fontSize: 20, color: kBasic, fontWeight: FontWeight.bold)),
      backgroundColor: kBody,
      elevation: 0.5,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
