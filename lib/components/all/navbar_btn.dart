import 'package:flutter/material.dart';

class DoubleButton extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;
  final bool showRightButton;

  const DoubleButton({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    this.onLeftPressed,
    this.onRightPressed,
    this.showRightButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 24),
      child: Row(
        children: [
          Expanded(
            flex: showRightButton ? 3 : 1,
            child: OutlinedButton(
              onPressed: onLeftPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 16,
                ),
              ),
              child: Text(
                leftLabel,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          if (showRightButton) ...[
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: onRightPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFF0A2342), // Xanh đậm
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 16,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  rightLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
