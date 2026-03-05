import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_nav_scaffold.dart';

class DeskripsiTanamanPage extends StatelessWidget {
  const DeskripsiTanamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SubPageScaffold(
      activeNavIndex: 0,
      body: Container(
        color: const Color(0xFFEBEDED),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero image with name overlay
              Stack(
                children: [
                  // Plant image with rounded corners
                  Container(
                    margin: const EdgeInsets.only(left: 18, right: 18, top: 10),
                    width: size.width - 36,
                    height: 360,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(47),
                      child: Image.asset(
                        'assets/images/detail-image.png',
                        width: size.width - 36,
                        height: 360,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: size.width - 36,
                          height: 360,
                          color: const Color(0xFF4A7C2E),
                          child: const Center(
                            child: Icon(
                              Icons.local_florist,
                              size: 80,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Back button
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 32,
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
                  // Plant name overlay at bottom of image
                  Positioned(
                    bottom: 20,
                    left: 36,
                    child: Text(
                      'Billenia indica L',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 8)],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Gallery section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Galery',
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGalleryCircle(
                          'assets/images/image-detail-gallery.png',
                        ),
                        _buildGalleryCircle(
                          'assets/images/image-detail-gallery-2.png',
                        ),
                        _buildGalleryCircle(
                          'assets/images/image-detail-gallery.png',
                        ),
                        _buildGalleryCircle(
                          'assets/images/image-detail-gallery-2.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Green "Nama lokal" banner + white description card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Green banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF009933),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama lokal',
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Simpur',
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Deskripsi section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Deskripsi',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Kingdom: Plantae (Tumbuhan)\nDivisi: Tracheophyta (Tumbuhan berpembuluh)\nKelas: Magnoliopsida (Dicotyledon)\nOrdo: Dilleniales\nFamili: Dilleniaceae (Suku simpur-simpuran)\nGenus: Dillenia',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 2.08,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Lokasi section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Lokasi',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Persebaran Geografis Berasal dari wilayah Asia tropis\nAsia Selatan, Asia Timur, Asia Tenggara, Indonesia.',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 2.08,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Habitat section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Habitat',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Habitat Alami tumbuh subur di lingkungan lembab dan\ndekat dengan sumber air',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF020202),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 2.08,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              const SizedBox(height: 120), // space for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryCircle(String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
