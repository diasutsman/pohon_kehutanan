import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_nav_scaffold.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      activeNavIndex: 4,
      body: Column(
        children: [
          // Green header
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Green rounded header
              Container(
                width: double.infinity,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xFF009933),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                ),
              ),
              // Back button
              Positioned(
                top: MediaQuery.of(context).padding.top + 14,
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
              // User avatar
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                right: 24,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD9D9D9),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/pp.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'History',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // History list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ).copyWith(bottom: 100),
              itemCount: 4,
              itemBuilder: (_, index) => _buildHistoryCard(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3F000000),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tree icon + plant image column
          Column(
            children: [
              SvgPicture.asset(
                'assets/images/ph_tree_green.svg',
                width: 34,
                height: 34,
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  'assets/images/history-image.png',
                  width: 60,
                  height: 89,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 60,
                    height: 89,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A7C2E),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.local_florist,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Info + bottom row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Billenia indica L',
                  style: GoogleFonts.lexend(
                    color: const Color(0xFF009933),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Habitat Alami tumbuh subur di lingkungan lembab dan dekat....',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                // Date + View button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '20 Nov 2025',
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/deskripsi'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF009933),
                          borderRadius: BorderRadius.circular(13.5),
                        ),
                        child: Text(
                          'View',
                          style: GoogleFonts.lexend(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
