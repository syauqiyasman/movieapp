import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final VoidCallback? iconOnPressed;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function(dynamic _)? onSubmitted;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.inputFormatter,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.maxLines,
    this.focusNode,
    this.iconOnPressed,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Row(
            children: [
              const SizedBox(width: 8.0),
              Text(
                labelText!,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        if (labelText != null)
          const SizedBox(height: 8.0),
        TextFormField(
          focusNode: focusNode,
          maxLines: maxLines ?? 1,
          obscureText: obscureText,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            prefixIcon: prefixIcon != null
                ? IconButton(
              icon: Icon(
                prefixIcon,
                color: Colors.grey,
              ),
              onPressed: iconOnPressed,
            )
                : null,
          ),
        ),
      ],
    );
  }
}
