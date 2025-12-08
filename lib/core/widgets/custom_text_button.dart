import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final TextStyle? style;
  final Alignment? alignment;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onClick,
    this.style,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerRight,
      child: GestureDetector(
        onTap: onClick,
        child: Text(text, style: style),
      ),
    );
  }
}
