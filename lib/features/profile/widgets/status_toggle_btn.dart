// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class StatusToggleBtn extends StatefulWidget {
  final Function(bool) onStatusChanged;

  const StatusToggleBtn({super.key, required this.onStatusChanged});

  @override
  State<StatusToggleBtn> createState() => _StatusToggleBtnState();
}

class _StatusToggleBtnState extends State<StatusToggleBtn> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.75,
          child: Switch(
            activeColor: Colors.green,
            activeTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.grey.shade300,
            inactiveTrackColor: Colors.grey,
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
          ),
        ),
        Text(isActive ? "Nhận lời mời" : "Từ chối lời mời"),
      ],
    );
  }
}
