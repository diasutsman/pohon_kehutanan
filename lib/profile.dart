import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gradient (Rectangle 34)
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0.36),
              end: Alignment(0.5, 1.0),
              colors: [Color(0x00009933), Color(0x19006C24)],
            ),
          ),
        ),
        // Green header (HIJAU section)
        Column(
          children: [
            // Rectangle 31 – rounded green block
            Container(
              width: double.infinity,
              height: 365,
              decoration: const BoxDecoration(
                color: Color(0xFF009933),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    // Avatar – Ellipse 3 (109×109, #D9D9D9)
                    Container(
                      width: 109,
                      height: 109,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFD9D9D9),
                        border: Border.all(color: Colors.white, width: 3),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/pp.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // "Hello, Albert!" – Lexend 600/25px, white
                    Text(
                      'Hello, Albert!',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Menu card (Rectangle 33)
        Positioned(
          top: 307,
          left: 40,
          right: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(27),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Edit profile – icon green (#009933)
                _buildMenuItem(
                  context,
                  icon: Icons.edit,
                  label: 'Edit profile',
                  onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                ),
                // Line 1 – 2px solid #EBEDED
                const Divider(
                  indent: 24,
                  endIndent: 24,
                  color: Color(0xFFEBEDED),
                  thickness: 2,
                ),
                // Change password – icon green (#009933)
                _buildMenuItem(
                  context,
                  icon: Icons.lock_outline,
                  label: 'Change password',
                  onTap: () => Navigator.pushNamed(context, '/change-password'),
                ),
                // Line 2
                const Divider(
                  indent: 24,
                  endIndent: 24,
                  color: Color(0xFFEBEDED),
                  thickness: 2,
                ),
                // History – icon green (#009933)
                _buildMenuItem(
                  context,
                  icon: Icons.history,
                  label: 'History',
                  onTap: () => Navigator.pushNamed(context, '/history'),
                ),
                // Line 3
                const Divider(
                  indent: 24,
                  endIndent: 24,
                  color: Color(0xFFEBEDED),
                  thickness: 2,
                ),
                // Log out – icon & text red (#AC0000)
                _buildMenuItem(
                  context,
                  icon: Icons.logout,
                  label: 'Log out',
                  isLogout: true,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    bool isLogout = false,
    required VoidCallback onTap,
  }) {
    // Icon & text color: green for normal items, red for logout
    final Color itemColor = isLogout
        ? const Color(0xFFAC0000)
        : const Color(0xFF009933);
    // Arrow color: gray for normal items, red for logout
    final Color arrowColor = isLogout
        ? const Color(0xFFAC0000)
        : const Color(0xFFA4A4A4);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: itemColor, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lexend(
                  color: isLogout
                      ? const Color(0xFFAC0000)
                      : const Color(0xFFA4A4A4),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.arrow_forward, color: arrowColor, size: 22),
          ],
        ),
      ),
    );
  }
}
