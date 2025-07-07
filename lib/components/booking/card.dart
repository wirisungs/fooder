import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String table;
  final String withWho;
  final String title;
  final VoidCallback? onTap;

  const BookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.table,
    required this.withWho,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 95,
              height: 95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/assets/png/img_test/jollicow.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Ngày: $date',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF1c1c1c),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Thời gian: $time',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF1c1c1c),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Bàn số: $table',
                    style: const TextStyle(fontSize: 10, color: Colors.black87),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Đi với: $withWho',
                    style: const TextStyle(fontSize: 10, color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF092247),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(58),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 9,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Chi tiết',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
