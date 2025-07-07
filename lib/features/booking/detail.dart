import 'package:flutter/material.dart';
import 'package:fooder/features/booking/main.dart';
import '../../components/all/navbar_btn.dart';
import '../../components/all/header.dart';
import '../../components/booking/rating_box.dart';
import '../../components/booking/review_item.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SimpleHeader(title: 'Nhà hàng đa năng Jollicowwwwwww'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                // Ảnh nhà hàng
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'lib/assets/png/img_test/jollicow.png',
                    height: 188,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                // Tên nhà hàng
                const Text(
                  'Nhà hàng đa năng Jollicow',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                // Địa chỉ
                const Text(
                  'Địa chỉ: Chung cư, 40E Ngô Đức Kế, Bến Nghé, Quận 1, Hồ Chí Minh 75000',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                // Mô tả
                const Text(
                  'Nhà hàng hảo hạng, nhiều món ngon. Không gian ấm cúng, mát mẻ, yên tĩnh, náo nhiệt. Là đối tác đầu tiên và duy nhất của chúng tôi.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                // Đánh giá sao
                const RatingBox(rating: 5, totalReviews: '102k+'),

                // Danh sách review
                const ReviewItem(
                  avatar: 'lib/assets/png/img_test/ava_test.png',
                  name: 'Nguyễn Đức Trí',
                  date: '03 thg 4, 2025',
                  rating: 5,
                  content:
                      'Ủa shop ơi?? sao em đánh giá 1 sao mà nó tự chuyển thành 5 sao vậy shop? Em order đồ ăn mà shop mang đồ chơi ra làm gì vậy shop????',
                ),

                const ReviewItem(
                  avatar: 'lib/assets/png/img_test/ava_test.png',
                  name: 'Nguyễn Thụy Thiên Phúc',
                  date: '03 thg 4, 2025',
                  rating: 5,
                  content:
                      'Sao em order matcha latte mà shop mang ra lẩu của hoàng đế vậy ạ?',
                ),
                const ReviewItem(
                  avatar: 'lib/assets/png/img_test/ava_test.png',
                  name: 'Nguyễn Đức Trí',
                  date: '03 thg 4, 2025',
                  rating: 5,
                  content:
                      'Ủa shop ơi?? sao em đánh giá 1 sao mà nó tự chuyển thành 5 sao vậy shop? Em order đồ ăn mà shop mang đồ chơi ra làm gì vậy shop????',
                ),
              ],
            ),
          ),
          DoubleButton(
            leftLabel: 'Đặt bàn',
            rightLabel: 'Lưu',
            onLeftPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingMainPage(),
                ),
              );
            },
            onRightPressed: () {},
            showRightButton: true,
          ),
        ],
      ),
    );
  }
}
