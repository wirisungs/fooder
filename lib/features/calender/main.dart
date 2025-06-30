import 'package:flutter/material.dart';
import '../../components/booking/tab.dart';
import '../../components/booking/card.dart';

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
      backgroundColor: Colors.white,
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
              children:
                  _selectedTab == 0
                      ? [
                        BookingCard(
                          date: '03/10/2004',
                          time: '19:00',
                          table: '02',
                          withWho: 'Người yêu / vợ / chồng',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                        BookingCard(
                          date: '04/10/2004',
                          time: '20:00',
                          table: '01',
                          withWho: 'Hẹn hò người lạ - Eren Yeager',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                        BookingCard(
                          date: '05/10/2004',
                          time: '09:00',
                          table: '01',
                          withWho: 'Người yêu / vợ / chồng',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                        BookingCard(
                          date: '05/10/2004',
                          time: '09:00',
                          table: '01',
                          withWho: 'Người yêu / vợ / chồng',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                        BookingCard(
                          date: '05/10/2004',
                          time: '09:00',
                          table: '01',
                          withWho: 'Người yêu / vợ / chồng',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                        BookingCard(
                          date: '05/10/2004',
                          time: '09:00',
                          table: '01',
                          withWho: 'Người yêu / vợ / chồng',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                      ]
                      : [
                        // Danh sách đã hoàn tất (có thể khác hoặc giống tuỳ ý)
                        BookingCard(
                          date: '01/10/2004',
                          time: '18:00',
                          table: '05',
                          withWho: 'Bạn bè',
                          title: 'Jollicow - Chuẩn hương vị bò',
                        ),
                      ],
            ),
          ),
        ],
      ),
    );
  }
}
