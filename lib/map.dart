import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Map background image
        Positioned.fill(
          child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
        ),
        // Back button
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 20,
          child: GestureDetector(
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
        ),
        // Logo (top right)
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 20,
          child: Image.asset(
            'assets/images/logo.png',
            height: 44,
            fit: BoxFit.contain,
          ),
        ),
        // Tree marker 1 — Entotolobium (top-right area)
        _buildTreeMarker(
          context,
          top: size.height * 0.18,
          left: size.width * 0.50,
          plantName: 'Entotolobium cy...',
          description:
              'Tumbuh optimal di dataran\nrendah hingga ketinggian\n1.200 mdpl....',
          imagePath: 'assets/images/map-image-2.png',
        ),
        // Tree marker 2 — Billenia (middle-left area)
        _buildTreeMarker(
          context,
          top: size.height * 0.38,
          left: size.width * 0.08,
          plantName: 'Billenia indica L',
          description:
              'Habitat Alami tumbuh\nsubur di lingkungan lembab\ndan dekat....',
          imagePath: 'assets/images/map-image-1.png',
        ),
        // Tree marker 3 — Billenia (lower-right area)
        _buildTreeMarker(
          context,
          top: size.height * 0.56,
          left: size.width * 0.50,
          plantName: 'Billenia indica L',
          description:
              'Habitat Alami tumbuh\nsubur di lingkungan lembab\ndan dekat....',
          imagePath: 'assets/images/map-image-1.png',
        ),
      ],
    );
  }

  Widget _buildTreeMarker(
    BuildContext context, {
    required double top,
    required double left,
    required String plantName,
    required String description,
    required String imagePath,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          // Tree pin icon
          SvgPicture.asset(
            'assets/images/ph_tree_green.svg',
            width: 38,
            height: 38,
          ),
          const SizedBox(height: 2),
          // Info card
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/deskripsi'),
            child: Container(
              width: 172,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      imagePath,
                      width: 43,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 43,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A7C2E),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plantName,
                          style: GoogleFonts.lexend(
                            color: const Color(0xFF009933),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: GoogleFonts.lexend(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
