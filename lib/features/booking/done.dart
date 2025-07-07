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
          const Expanded(
            child: Center(
              child: Text(
                'Booking Done Page',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
