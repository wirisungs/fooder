import 'package:flutter/material.dart';
// import '../auth/login.dart';

class NofiPage extends StatelessWidget {
  const NofiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Nofi',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
