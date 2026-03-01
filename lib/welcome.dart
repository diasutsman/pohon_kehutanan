import 'dart:ui';
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
          // Background image - full cover
          Image.asset(
            'assets/images/bg-login.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),

          // Blurred bottom section (~60% from top, 40% height)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: size.height * 0.40,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.85, sigmaY: 5.85),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          // First gradient overlay (starts fading earlier)
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

          // Second gradient overlay (stronger at bottom)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6416, 0.8605, 1.0],
                colors: [
                  Color(0x00009933),
                  Color(0xFF003311),
                  Color(0xFF03210D),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Top spacing to position logo at ~25% from top
                SizedBox(height: size.height * 0.20),

                // Logo
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.20),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: size.height * 0.113,
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

                const Spacer(),

                // Title and description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Selamat Datang\ndi Aplikasi Pohon',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          height: 1.24,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and\ntypesetting industry. Lorem Ipsum has been the industry\'s',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          height: 1.67,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      // Buttons row
                      Row(
                        children: [
                          // SCAN button (text left, icon right)
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/scan'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF009933),
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SCAN',
                                      style: GoogleFonts.lexend(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.qr_code_scanner,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 22),
                          // LOGIN button (text left, icon right)
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/login'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.20,
                                  ),
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: GoogleFonts.lexend(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.045),

                // Version text
                Text(
                  'version. 1.0.7',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
