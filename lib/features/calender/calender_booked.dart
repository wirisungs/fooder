import 'package:flutter/material.dart';
import '../auth/login.dart';

class CalenderbookerPage extends StatelessWidget {
  const CalenderbookerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Calender'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Go to Calender Booker'),
            ),
          ],
        ),
      ),
    );
  }
}
