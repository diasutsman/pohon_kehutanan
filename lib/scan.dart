import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Camera/plant background
          Image.asset(
            'figma-uis/SCAN.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
            errorBuilder: (_, __, ___) => Container(
              color: const Color(0xFF4A7C2E),
              child: const Center(
                child: Icon(Icons.camera_alt, size: 80, color: Colors.white54),
              ),
            ),
          ),
          // Slight gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0),
                  const Color(0x4C666666),
                ],
              ),
            ),
          ),
          // Top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.3),
                    Colors.white.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3F000000),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Text(
                      'Recognation',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 80),
                ],
              ),
            ),
          ),
          // Scanning frame in center
          Center(
            child: Container(
              width: size.width * 0.65,
              height: size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: const Alignment(0.5, 0.6),
                  colors: [
                    const Color(0xFFD9D9D9).withValues(alpha: 0.5),
                    const Color(0x00737373),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.qr_code_2,
                  size: size.width * 0.45,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // Analisis button
          Positioned(
            bottom: size.height * 0.22,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Analisis...',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Cancel button
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 53,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
