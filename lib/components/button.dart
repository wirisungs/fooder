import 'package:flutter/material.dart';

class ButtonHaveOutline extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  const ButtonHaveOutline({
    Key? key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Color(0xFFD9D9D9), width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(58),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1C1C1C),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class ButtonFill extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  const ButtonFill({
    Key? key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF092247),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(58),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
