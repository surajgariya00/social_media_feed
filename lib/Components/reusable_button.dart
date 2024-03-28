import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final Color initialColor;
  final Color textColor;

  const ReusableButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.initialColor = const Color.fromARGB(255, 68, 97, 242),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 50,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: initialColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
