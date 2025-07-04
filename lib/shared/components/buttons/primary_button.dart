import 'package:flutter/material.dart';

enum ButtonVariant { filled, outlined }

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool isLoading;
  final ButtonVariant variant;
  final Color? color;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fullWidth = false,
    this.isLoading = false,
    this.variant = ButtonVariant.filled,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = color ?? theme.primaryColor;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: variant == ButtonVariant.filled
          ? FilledButton(
              onPressed: isLoading ? null : onPressed,
              style: FilledButton.styleFrom(backgroundColor: buttonColor),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(text),
            )
          : OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: buttonColor,
                side: BorderSide(color: buttonColor),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(text),
            ),
    );
  }
}
