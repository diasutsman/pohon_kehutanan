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
          // Forest background
          Image.asset(
            'figma-uis/SIGN IN.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF2D5016)),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0.4),
                end: const Alignment(0.5, 1.3),
                colors: [
                  const Color(0x00009933),
                  const Color(0xFF003311).withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // Logo
                  _buildLogo(),
                  const SizedBox(height: 32),
                  // Title
                  Text(
                    'Hello, Silahkan Daftar',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the industry\'s',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      height: 1.67,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Nama field
                  _buildTextField(
                    controller: _nameController,
                    hintText: 'Nama',
                  ),
                  const SizedBox(height: 20),
                  // Email field
                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  // No telpon field
                  _buildTextField(
                    controller: _phoneController,
                    hintText: 'No telpon',
                  ),
                  const SizedBox(height: 24),
                  // SIGN IN button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
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
                  const SizedBox(height: 28),
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
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
