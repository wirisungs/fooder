import 'dart:ui';
import 'package:flutter/material.dart';
import '../calender/main.dart';
import '../auth/register.dart'; // Added import for RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/assets/png/background.png', fit: BoxFit.cover),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 82),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thà chọn sai người', style: kTitleTextStyle),
                    Text('Chứ không sai quán!', style: kSubtitleTextStyle),
                  ],
                ),
              ),
              const SizedBox(height: 67),
              // const Spacer(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: kGlassmorphismContainerDecoration,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Đăng nhập', style: kLoginHeaderTextStyle),
                          const SizedBox(height: 24),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Số điện thoại',
                              style: kLabelTextStyle,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            style: kInputTextStyle,
                            decoration: kTextFieldDecoration(
                              hintText: 'Nhập số điện thoại',
                              opacity: 0.01, // Độ mờ cho ô input 1
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Mật khẩu', style: kLabelTextStyle),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            obscureText: _obscure,
                            style: kInputTextStyle,
                            decoration: kTextFieldDecoration(
                              hintText: 'Nhập mật khẩu',
                              opacity: 0.01, // Độ mờ cho ô input 2
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscure = !_obscure;
                                  });
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Chuyển sang trang đăng ký
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          const RegisterPage(), // Thay bằng trang đăng ký của bạn
                                ),
                              );
                            },
                            child: Text(
                              "Chưa có tài khoản ? Đăng kí",
                              style: register,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: kLoginButtonStyle,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Đăng nhập',
                                style: kLoginButtonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== STYLES ==========

const register = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.underline,
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.w400,
);

const kSubtitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.w400,
);

const kLoginHeaderTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const kLabelTextStyle = TextStyle(
  color: Color.fromRGBO(255, 255, 255, 0.9),
  fontWeight: FontWeight.w500,
);

const kInputTextStyle = TextStyle(color: Colors.white);
const kHintTextStyle = TextStyle(color: Colors.white70);

const kLoginButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

InputDecoration kTextFieldDecoration({
  required String hintText,
  Widget? suffixIcon,
  double opacity = 0.08,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(opacity),
    hintText: hintText,
    hintStyle: kHintTextStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white54),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white54),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    ),
    suffixIcon: suffixIcon,
  );
}

final kGlassmorphismContainerDecoration = BoxDecoration(
  color: Colors.white.withOpacity(0.04),
  borderRadius: BorderRadius.circular(32),
  border: Border.all(color: Colors.white.withOpacity(0.15)),
);

//btn login
final kLoginButtonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(color: Colors.white),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
  padding: const EdgeInsets.symmetric(vertical: 16),
  backgroundColor: Colors.white.withOpacity(0.04),
);
