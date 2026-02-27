import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Forest background image
          Image.asset(
            'figma-uis/welcome.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0.3),
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0x00009933),
                  const Color(0xFF003311).withValues(alpha: 0.85),
                  const Color(0xFF02200C),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Image.asset(
                    'figma-uis/LOGIN.png',
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.park,
                          color: const Color(0xFF009933),
                          size: 50,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'KEMENTERIAN',
                              style: GoogleFonts.lexend(
                                color: const Color(0xFF009933),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'KEHUTANAN',
                              style: GoogleFonts.lexend(
                                color: const Color(0xFF009933),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'REPUBLIK INDONESIA',
                              style: GoogleFonts.lexend(
                                color: const Color(0xFF009933),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 4),
                // Title and description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Selamat Datang\ndi Aplikasi Pohon',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the industry\'s',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          height: 1.67,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Buttons
                      Row(
                        children: [
                          // SCAN button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/scan'),
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                color: Colors.white,
                                size: 22,
                              ),
                              label: Text(
                                'SCAN',
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF009933),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // LOGIN button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              icon: const Icon(
                                Icons.login,
                                color: Colors.white,
                                size: 22,
                              ),
                              label: Text(
                                'LOGIN',
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.20,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
