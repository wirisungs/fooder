import 'dart:ui';
import 'package:flutter/material.dart';
import '../auth/info.dart';
import '../../components/auth/input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                          const Text('Đăng ký', style: kLoginHeaderTextStyle),
                          const SizedBox(height: 24),
                          InputField(
                            label: 'Số điện thoại',
                            hintText: 'Nhập số điện thoại',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            opacity: 0.01,
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            label: 'Email',
                            hintText: 'Nhập email',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            opacity: 0.01,
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            label: 'Mật khẩu',
                            hintText: 'Nhập mật khẩu',
                            controller: _passwordController,
                            obscureText: _obscure,
                            opacity: 0.01,
                            suffixIcon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white70,
                            ),
                            onSuffixIconPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            label: 'Nhập lại mật khẩu',
                            hintText: 'Nhập mật khẩu',
                            controller: _passwordController,
                            obscureText: _obscure,
                            opacity: 0.01,
                            suffixIcon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white70,
                            ),
                            onSuffixIconPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: kLoginButtonStyle,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const InfoPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Tiếp theo',
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
