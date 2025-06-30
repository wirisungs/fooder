import 'package:flutter/material.dart';
import '../../components/booking/tab.dart';

class CalenderbookerPage extends StatefulWidget {
  const CalenderbookerPage({super.key});

  @override
  State<CalenderbookerPage> createState() => _CalenderbookerPageState();
}

class _CalenderbookerPageState extends State<CalenderbookerPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          BookingTabBar(
            selectedIndex: _selectedTab,
            onTabChanged: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children:
                  _selectedTab == 0
                      ? [
                        BookingCard(
                          date: '03/10/2004',
                          time: '19:00',
                          table: '02',
                          withWho: 'Người yêu / vợ / chồng',
                        ),
                        BookingCard(
                          date: '04/10/2004',
                          time: '20:00',
                          table: '01',
                          withWho: 'Hẹn hò người lạ - Eren Yeager',
                        ),
                        BookingCard(
                          date: '05/10/2004',
                          time: '09:00',
                          table: '01',
                          withWho: 'Người yêu / vợ / chồng',
                        ),
                      ]
                      : [
                        // Danh sách đã hoàn tất (có thể khác hoặc giống tuỳ ý)
                        BookingCard(
                          date: '01/10/2004',
                          time: '18:00',
                          table: '05',
                          withWho: 'Bạn bè',
                        ),
                      ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String table;
  final String withWho;

  const BookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.table,
    required this.withWho,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            height: 99,
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
                const Text(
                  'Jollicow - Chuẩn hương vị bò',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Ngày: $date',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Thời gian: $time',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Bàn số: $table',
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 2),
                Text(
                  'Đi với: $withWho',
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A285F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Chi tiết',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
