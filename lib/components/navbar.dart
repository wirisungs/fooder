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

class _NavbarScaffoldState extends State<NavbarScaffold>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _dragPosition = -1;
  bool _isDragging = false;

  final List<Widget> _pages = [
    CalenderbookerPage(),
    SearchPage(),
    NofiPage(),
    UserPage(),
  ];

  final List<_NavItemData> _navItems = const [
    _NavItemData(
      iconOn: 'lib/assets/svg/navbar_on/calendar.svg',
      iconOff: 'lib/assets/svg/navbar_off/calendar.svg',
      label: 'Trang chủ',
    ),
    _NavItemData(
      iconOn: 'lib/assets/svg/navbar_on/search.svg',
      iconOff: 'lib/assets/svg/navbar_off/search.svg',
      label: 'Tìm kiếm',
    ),
    _NavItemData(
      iconOn: 'lib/assets/svg/navbar_on/nofi.svg',
      iconOff: 'lib/assets/svg/navbar_off/nofi.svg',
      label: 'Thông báo',
    ),
    _NavItemData(
      iconOn: 'lib/assets/svg/navbar_on/user.svg',
      iconOff: 'lib/assets/svg/navbar_off/user.svg',
      label: 'Tài khoản',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTabSelection(int newIndex, double tabWidth) {
    if (_selectedIndex == newIndex && !_animationController.isAnimating) return;

    setState(() => _isDragging = true);

    final targetPosition = newIndex * tabWidth;

    _animation = Tween<double>(
      begin: _dragPosition,
      end: targetPosition,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
    );

    _animation.addListener(
      () => setState(() => _dragPosition = _animation.value),
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _isDragging = false);
      }
    });

    _animationController.reset();
    _animationController.forward();

    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 48;
    final tabCount = _navItems.length;
    final tabWidth = width / tabCount;

    if (_dragPosition == -1) {
      _dragPosition = _selectedIndex * tabWidth;
    }

    final int hoverIndex = (_dragPosition / tabWidth).round().clamp(
      0,
      tabCount - 1,
    );

    final double bubbleScale = _isDragging ? 1.15 : 1.0;
    const double baseHeight = 70.0;

    final double scaledWidth = tabWidth * bubbleScale;
    final double scaledHeight = baseHeight * bubbleScale;
    final double horizontalPadding = (scaledWidth - tabWidth) / 2;
    final double verticalPadding = (scaledHeight - baseHeight) / 2;

    final double newLeft = _dragPosition - horizontalPadding;
    final double newTop = -verticalPadding;

    // Gradient cho viền bong bóng xà phòng
    final bubbleBorder =
        _isDragging
            ? LinearGradient(
              colors: const [
                Color(0xFF61A5C2), // Xanh dương nhạt
                Color(0xFF89C2D9), // Xanh dương nhạt hơn
                Color(0xFFA9D6E5), // Xanh dương rất nhạt
                Color(0xFF61A5C2), // Quay lại màu đầu
              ],
              stops: const [0.0, 0.33, 0.66, 1.0],
            ).createShader(Rect.fromLTWH(0, 0, scaledWidth, scaledHeight))
            : null;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      extendBody: true,
      body: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(24),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onHorizontalDragStart: (details) {
              setState(() => _isDragging = true);
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                _dragPosition += details.delta.dx;
                _dragPosition = _dragPosition.clamp(0.0, width - tabWidth);
              });
            },
            onHorizontalDragEnd: (details) {
              int newIndex = (_dragPosition / tabWidth).round();
              _handleTabSelection(newIndex, tabWidth);
            },
            child: Container(
              clipBehavior: Clip.none,
              width: width,
              height: 70,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: width,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.black12, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.elasticOut,
                    left: newLeft,
                    top: newTop,
                    width: scaledWidth,
                    height: scaledHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.grey.withOpacity(0.2),
                            Colors.grey.withOpacity(0.2),
                            Colors.grey.withOpacity(0.0),
                          ],
                          stops: const [0.0, 0.2, 0.8, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border:
                            _isDragging
                                ? Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.8),
                                )
                                : null,
                        boxShadow:
                            _isDragging
                                ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ]
                                : null,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(_navItems.length, (index) {
                      final isVisuallySelected = index == hoverIndex;
                      return Expanded(
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _isDragging = true),
                          onTapUp: (_) {
                            _handleTabSelection(index, tabWidth);
                          },
                          onTapCancel:
                              () => setState(() => _isDragging = false),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32),
                            onTap: () => _handleTabSelection(index, tabWidth),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedScale(
                                  scale: isVisuallySelected ? 1.15 : 1.0,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.elasticOut,
                                  child: SvgPicture.asset(
                                    isVisuallySelected
                                        ? _navItems[index].iconOn
                                        : _navItems[index].iconOff,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                      isVisuallySelected
                                          ? Colors.black
                                          : Colors.grey,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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

class _NavItemData {
  final String iconOn;
  final String iconOff;
  final String label;
  const _NavItemData({
    required this.iconOn,
    required this.iconOff,
    required this.label,
  });
}
