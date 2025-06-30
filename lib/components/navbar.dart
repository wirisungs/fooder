import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../features/calender/main.dart';
import '../features/notification/main.dart';
import '../features/user/main.dart';
import '../features/search/main.dart';

class NavbarScaffold extends StatefulWidget {
  const NavbarScaffold({super.key});

  @override
  State<NavbarScaffold> createState() => _NavbarScaffoldState();
}

class _NavbarScaffoldState extends State<NavbarScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalenderbookerPage(),
    SearchPage(),
    NofiPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Cho phép hiển thị phía sau navbar
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0), // Khoảng cách cách đáy
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24), // Floating
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.black12, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 0
                          ? 'lib/assets/svg/navbar_on/calendar.svg'
                          : 'lib/assets/svg/navbar_off/calendar.svg',
                      height: 24,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 1
                          ? 'lib/assets/svg/navbar_on/search.svg'
                          : 'lib/assets/svg/navbar_off/search.svg',
                      height: 24,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 2
                          ? 'lib/assets/svg/navbar_on/nofi.svg'
                          : 'lib/assets/svg/navbar_off/nofi.svg',
                      height: 24,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 3
                          ? 'lib/assets/svg/navbar_on/user.svg'
                          : 'lib/assets/svg/navbar_off/user.svg',
                      height: 24,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
