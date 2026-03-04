import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/bg-login2.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),

          // Full-screen backdrop blur
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.85, sigmaY: 5.85),
              child: Container(color: Colors.transparent),
            ),
          ),

          // First gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3648, 0.6373, 0.9572],
                colors: [
                  Color(0x00009933),
                  Color(0xFF003311),
                  Color(0xFF03210D),
                ],
              ),
            ),
          ),

          // Second gradient overlay (lighter, bottom-heavy)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6416, 1.0],
                colors: [Color(0x00009933), Color(0xFF003311)],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top spacing (~107px from top of screen, minus safe area)
                  const SizedBox(height: 40),

                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 72,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => _buildLogoFallback(),
                  ),

                  // Gap: 225 - 107 - 72 = 46
                  const SizedBox(height: 46),

                  // Title
                  Text(
                    'Hello, Silahkan Login',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      height: 1.24,
                    ),
                  ),

                  // Gap: 267 - 225 - 31 = 11
                  const SizedBox(height: 11),

                  // Description
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the industry\'s',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      height: 1.67,
                    ),
                  ),

                  // Gap: 392 - 267 - 40 = 85
                  const SizedBox(height: 85),

                  // Username field
                  _buildTextField(
                    controller: _usernameController,
                    hintText: 'Username...',
                  ),

                  // Gap: 478 - 392 - 60 = 26
                  const SizedBox(height: 26),

                  // Password field
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscure: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFC0C0C0),
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),

                  // Gap: 564 - 478 - 60 = 26
                  const SizedBox(height: 26),

                  // LOGIN button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C7A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                        shadowColor: const Color(0x3F000000),
                      ),
                      child: Text(
                        'LOGIN',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Gap: 661 - 564 - 60 = 37
                  const SizedBox(height: 37),

                  // "Belum punya akun?"
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/signin'),
                      child: Text(
                        'Belum punya akun?',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  // Gap: 711 - 661 - 20 = 30
                  const SizedBox(height: 30),

                  // "Login menggunakan sosmed"
                  Center(
                    child: Text(
                      'Login menggunakan sosmed',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  // Gap: 745 - 711 - 20 = 14
                  const SizedBox(height: 14),

                  // Social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      Container(
                        width: 49,
                        height: 49,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.g_mobiledata,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 11),
                      // Facebook button
                      Container(
                        width: 49,
                        height: 49,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.facebook,
                          color: Color(0xFF1877F2),
                          size: 28,
                        ),
                      ),
                    ],
                  ),

                  // Gap to version text
                  SizedBox(height: size.height * 0.08),

                  // Version text
                  Center(
                    child: Text(
                      'version. 1.0.7',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFA4A4A4),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoFallback() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.park, color: const Color(0xFF009933), size: 40),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'KEMENTERIAN',
              style: GoogleFonts.lexend(
                color: const Color(0xFF009933),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'KEHUTANAN',
              style: GoogleFonts.lexend(
                color: const Color(0xFF009933),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'REPUBLIK INDONESIA',
              style: GoogleFonts.lexend(
                color: const Color(0xFF009933),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10.6,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lexend(
            color: const Color(0xFFC0C0C0),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 18,
          ),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
