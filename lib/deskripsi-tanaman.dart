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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image with name overlay
            Stack(
              children: [
                // Plant image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'figma-uis/DESKRIPSI TANAMAN.png',
                    width: size.width,
                    height: 350,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: size.width,
                      height: 350,
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
                // Plant name overlay
                Positioned(
                  bottom: 20,
                  left: 24,
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
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
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => _buildGalleryCircle(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Green "Nama lokal" banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
            _buildSectionTitle('Deskripsi'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Kingdom: Plantae (Tumbuhan)\nDivisi: Tracheophyta (Tumbuhan berpembuluh)\nKelas: Magnoliopsida (Dicotyledon)\nOrdo: Dilleniales\nFamili: Dilleniaceae (Suku simpur-simpuran)\nGenus: Dillenia',
                style: GoogleFonts.lexend(
                  color: const Color(0xFF010101),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 2.08,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Lokasi section
            _buildSectionTitle('Lokasi'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Persebaran Geografis Berasal dari wilayah Asia tropis\nAsia Selatan, Asia Timur, Asia Tenggara, Indonesia.',
                style: GoogleFonts.lexend(
                  color: const Color(0xFF010101),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 2.08,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Habitat section
            _buildSectionTitle('Habitat'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Habitat Alami tumbuh subur di lingkungan lembab dan\ndekat dengan sumber air',
                style: GoogleFonts.lexend(
                  color: const Color(0xFF010101),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 2.08,
                ),
              ),
            ),
            const SizedBox(height: 120), // space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        title,
        style: GoogleFonts.lexend(
          color: const Color(0xFF010101),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGalleryCircle() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF4A7C2E),
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('figma-uis/DESKRIPSI TANAMAN.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
