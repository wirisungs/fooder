import 'package:flutter/material.dart';

class BookingTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const BookingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _TabItem(
              text: 'Đã đặt bàn',
              selected: selectedIndex == 0,
              onTap: () => onTabChanged(0),
            ),
            _TabItem(
              text: 'Đã hoàn tất',
              selected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
            ),
          ],
        ),
        Stack(
          children: [
            // Đường line mờ phía dưới
            Container(
              margin: const EdgeInsets.only(top: 2),
              height: 2,
              width: double.infinity,
              color: Colors.red.withOpacity(0.15),
            ),
            // Gạch chân đỏ cho tab đang chọn
            AnimatedAlign(
              alignment:
                  selectedIndex == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                height: 3,
                width: MediaQuery.of(context).size.width / 2 - 32,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
