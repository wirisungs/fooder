// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:fooder/features/profile/widgets/status_toggle_btn.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data tạm
    final Map<String, dynamic> userData = {
      'id': 'thrisei03',
      'name': 'Trần Hữu Minh Trí',
      'bio': 'Chào cô gái, em ăn cơm chưa?',
      'favorite': 'Lãng mang, yên tĩnh, chill',
      'status': true,
    };
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            child: Column(
              children: [
                // Thanh chức năng
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: StatusToggleBtn(
                          onStatusChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.send_and_archive_rounded, size: 24),
                          SizedBox(width: 16),
                          Icon(Icons.settings),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Thông tin cá nhân
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '@${userData['id']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF757575),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            userData['bio'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/img/image.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
