import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.36),
          end: Alignment(0.5, 1.0),
          colors: [Color(0xFFEBEDED), Color(0xFFD4E8D9)],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Top bar: back button + avatar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD9D9D9),
                      image: const DecorationImage(
                        image: AssetImage('figma-uis/PROFILE.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Albert!',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'How can i help you today?',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Center cloud/tree watermark
            Expanded(
              child: Center(
                child: Icon(
                  Icons.park_outlined,
                  size: 120,
                  color: Colors.grey.withValues(alpha: 0.15),
                ),
              ),
            ),
            // Plant info cards (horizontal scroll)
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) => _buildPlantCard(),
              ),
            ),
            const SizedBox(height: 12),
            // Input bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: 20),
              child: Row(
                children: [
                  // "+" button
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 8),
                  // Text field
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/ai-chat'),
                        child: Text(
                          'Ask me anything...',
                          style: GoogleFonts.lexend(
                            color: const Color(0xFFA7A7A7),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Mic button
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFF009933),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCard() {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          // Plant image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'figma-uis/DESKRIPSI TANAMAN.png',
              width: 43,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 43,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A7C2E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_florist,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Billenia indica L',
                  style: GoogleFonts.lexend(
                    color: const Color(0xFF009933),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Habitat Alami tumbuh subur di lingkungan lembab dan dekat...',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 7,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
