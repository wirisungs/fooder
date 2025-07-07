import 'package:flutter/material.dart';
import '../../components/all/navbar_btn.dart';
import '../../components/all/navbar.dart';

class RatingDonePage extends StatelessWidget {
  const RatingDonePage({super.key});

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
                    'Cảm ơn đánh giá của bạn',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Bảng thông tin
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
