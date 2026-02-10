import 'package:flutter/material.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final BlaButtonType type;
  final double? width;
  final double height;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = BlaButtonType.primary,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == BlaButtonType.primary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.blue : Colors.white,
          foregroundColor: isPrimary ? Colors.white : Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: !isPrimary
                ? const BorderSide(color: Color.fromARGB(255, 214, 214, 214))
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
