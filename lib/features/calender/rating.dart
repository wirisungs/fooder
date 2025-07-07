import 'package:flutter/material.dart';
import '../../components/all/navbar_btn.dart';
import '../../components/all/navbar.dart';
import '../../components/all/header.dart';
import '../../components/all/input.dart';
import '../calender/Rating_Done.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SimpleHeader(title: 'Đặt bàn'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Ảnh nhà hàng
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'lib/assets/png/img_test/jollicow.png',
                      width: double.infinity,
                      height: 151,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tên nhà hàng
                  const Text(
                    'Jollicow - Chuẩn hương vị bò',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Ô nhập review
                  BigInput(
                    hintText:
                        "Bạn thích dịch vụ nhà hàng này chứ, hãy đánh giá đi nào",
                  ),
                  const SizedBox(height: 32),
                  // Tiêu đề đánh giá
                  const Text(
                    'Đánh giá dịch vụ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // 5 icon sao
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          size: 32,
                          color:
                              index < rating ? Colors.amber : Colors.grey[300],
                        ),
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          DoubleButton(
            leftLabel: 'Đánh giá',
            rightLabel: 'Lưu',
            onLeftPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RatingDonePage()),
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
