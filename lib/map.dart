import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Map background
        Container(
          width: size.width,
          height: size.height,
          color: const Color(0xFFE8E0D0),
          child: CustomPaint(painter: _MapPainter()),
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
          top: MediaQuery.of(context).padding.top + 14,
          right: 20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.park, color: const Color(0xFF009933), size: 28),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'KEMENTERIAN',
                    style: GoogleFonts.lexend(
                      color: const Color(0xFF009933),
                      fontSize: 6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'KEHUTANAN',
                    style: GoogleFonts.lexend(
                      color: const Color(0xFF009933),
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Tree marker 1
        _buildTreeMarker(
          context,
          top: size.height * 0.20,
          left: size.width * 0.55,
          plantName: 'Entotolobium cy...',
          description:
              'Tumbuh optimal di dataran\nrendah hingga ketinggian\n1.200 mdpl....',
        ),
        // Tree marker 2
        _buildTreeMarker(
          context,
          top: size.height * 0.42,
          left: size.width * 0.15,
          plantName: 'Billenia indica L',
          description:
              'Habitat Alami tumbuh\nsubur di lingkungan lembab\ndan dekat....',
        ),
        // Tree marker 3
        _buildTreeMarker(
          context,
          top: size.height * 0.58,
          left: size.width * 0.55,
          plantName: 'Billenia indica L',
          description:
              'Habitat Alami tumbuh\nsubur di lingkungan lembab\ndan dekat....',
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
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          // Pin icon
          Icon(Icons.location_on, color: const Color(0xFF009933), size: 34),
          // Info card
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/deskripsi'),
            child: Container(
              width: 170,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'figma-uis/DESKRIPSI TANAMAN.png',
                      width: 40,
                      height: 58,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 40,
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A7C2E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plantName,
                          style: GoogleFonts.lexend(
                            color: const Color(0xFF009933),
                            fontSize: 10,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw some green areas to simulate a map
    paint.color = const Color(0xFFC5D9B2).withValues(alpha: 0.6);
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.1,
        size.height * 0.15,
        size.width * 0.35,
        size.height * 0.2,
      ),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.5,
        size.height * 0.3,
        size.width * 0.45,
        size.height * 0.25,
      ),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.05,
        size.height * 0.5,
        size.width * 0.4,
        size.height * 0.15,
      ),
      paint,
    );

    // Draw some roads
    paint.color = const Color(0xFFD5CEC0);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    final path = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.35,
        size.width * 0.6,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.6,
        size.width,
        size.height * 0.55,
      );
    canvas.drawPath(path, paint);

    final path2 = Path()
      ..moveTo(size.width * 0.5, 0)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.25,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height * 0.75,
        size.width * 0.5,
        size.height,
      );
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
