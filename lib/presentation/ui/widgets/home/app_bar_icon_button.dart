import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 16,
        child: Icon(
          iconData,
          size: 22,
          color: Colors.black54,
        ),
      ),
    );
  }
}
