import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/all/navbar_btn.dart';
import '../../components/all/header.dart';
import 'package:fooder/features/booking/done.dart';
import '../../components/all/input.dart';

class BookingMainPage extends StatefulWidget {
  const BookingMainPage({super.key});

  @override
  State<BookingMainPage> createState() => _BookingMainPageState();
}

class _BookingMainPageState extends State<BookingMainPage> {
  DateTime selectedDate = DateTime(2000, 12, 3);
  TimeOfDay selectedTime = const TimeOfDay(hour: 17, minute: 0);
  TextEditingController noteController = TextEditingController();
  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SimpleHeader(title: 'Đặt bàn'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Chọn ngày đến
                  const Text(
                    'Chọn ngày đến',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  InputComponent(
                    hintText: "Tìm nhà hàng",
                    suffixIcon: SvgPicture.asset(
                      'lib/assets/svg/components/calendar.svg',
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Chọn giờ đến
                  const Text(
                    'Chọn giờ đến',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  InputComponent(
                    hintText: "Tìm nhà hàng",
                    suffixIcon: SvgPicture.asset(
                      'lib/assets/svg/components/go.svg',
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Yêu cầu thêm
                  const Text(
                    'Yêu cầu thêm',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  BigInput(hintText: "Yêu cầu..."),
                  const SizedBox(height: 24),
                  // Bạn đến đây với...
                  const Text(
                    'Bạn đến đây với...',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  RadioListTile<int>(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (val) => setState(() => groupValue = val),
                    title: const Text(
                      'Người yêu / Vợ / Chồng',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  RadioListTile<int>(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (val) => setState(() => groupValue = val),
                    title: const Text(
                      'Hẹn hò người lạ',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 12),
                  // Lưu ý
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Lưu ý: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Quý khách chỉ có thể đặt bàn cách thời điểm hiện tại ít nhất 5 tiếng',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DoubleButton(
            leftLabel: 'Đặt bàn',
            rightLabel: 'Lưu',
            onLeftPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingDonePage(),
                ),
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
