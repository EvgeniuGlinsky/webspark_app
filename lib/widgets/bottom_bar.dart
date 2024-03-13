import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isActive;

  const BottomBar({
    required this.onPressed,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isActive,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isActive ? const Color(0xFF6B8E47) : Colors.black12,
          elevation: isActive ? 4 : 0,
          padding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
