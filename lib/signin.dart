import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                  // Top spacing
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
                    'Hello, Silahkan Daftar',
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

                  // Gap: 386 - 267 - 40 = 79
                  const SizedBox(height: 79),

                  // Nama field
                  _buildTextField(
                    controller: _nameController,
                    hintText: 'Nama',
                  ),

                  // Gap: 471 - 386 - 60 = 25
                  const SizedBox(height: 25),

                  // Email field
                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),

                  // Gap: 554 - 471 - 60 = 23
                  const SizedBox(height: 23),

                  // No telpon field
                  _buildTextField(
                    controller: _phoneController,
                    hintText: 'No telpon',
                  ),

                  // Gap: 639 - 554 - 60 = 25
                  const SizedBox(height: 25),

                  // SIGN IN button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C7A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                        shadowColor: const Color(0x3F000000),
                      ),
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Gap: 724 - 639 - 60 = 25
                  const SizedBox(height: 25),

                  // "Sudah punya akun?"
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      child: Text(
                        'Sudah punya akun?',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  // Gap to version text
                  SizedBox(height: size.height * 0.12),

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
        ),
      ),
    );
  }
}
