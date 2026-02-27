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
          // Forest background
          Image.asset(
            'figma-uis/LOGIN.png',
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
                    'Hello, Silahkan Login',
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
                  // Username field
                  _buildTextField(
                    controller: _usernameController,
                    hintText: 'Username...',
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 24),
                  // LOGIN button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
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
                  const SizedBox(height: 28),
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
                  const SizedBox(height: 20),
                  // Social login
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
                  const SizedBox(height: 16),
                  // Social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.g_mobiledata, 'G'),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.facebook, 'F'),
                    ],
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
    bool obscure = false,
    Widget? suffixIcon,
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

  Widget _buildSocialButton(IconData icon, String label) {
    return Container(
      width: 49,
      height: 49,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: label == 'G' ? Colors.red : const Color(0xFF1877F2),
        size: 28,
      ),
    );
  }
}
