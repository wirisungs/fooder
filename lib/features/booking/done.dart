import 'package:flutter/material.dart';
import '../../components/all/navbar_btn.dart';
import '../../components/all/navbar.dart';

class BookingDonePage extends StatelessWidget {
  const BookingDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  // Ảnh minh hoạ
                  Image.asset(
                    'lib/assets/png/done_img.png',
                    // width: 180,
                    height: 212,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 24),
                  // Tiêu đề
                  const Text(
                    'Hoàn tất đặt bàn',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Bảng thông tin
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: const [
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Nhà hàng:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Jollicow - Chuẩn hương vị bò',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Ngày:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '03/10/2004',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Thời gian:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '19:00',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Bàn số:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text('02', style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Đến với:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Hẹn hò người lạ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Người hẹn hò:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Eren Yeager',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DoubleButton(
            leftLabel: 'Quay về',
            rightLabel: 'Lưu',
            onLeftPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavbarScaffold()),
              );
            },
            onRightPressed: () {},
            showRightButton: false,
          ),
        ],
      ),
    );
  }
}
