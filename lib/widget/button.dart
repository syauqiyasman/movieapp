import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final double? width;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;

  const Button({
    super.key,
    required this.label,
    this.width,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48.0,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal[500],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          elevation: 4,
          shadowColor: Colors.black,
        ),
        child: !isLoading
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
            : const SizedBox(
          width: 18.0,
          height: 18.0,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3.0,
          ),
        ),
      ),
    );
  }
}
