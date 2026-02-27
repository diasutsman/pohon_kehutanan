import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0.36),
              end: Alignment(0.5, 1.0),
              colors: [Color(0x00009933), Color(0x19006C24)],
            ),
          ),
        ),
        // Green header
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 340,
              decoration: BoxDecoration(
                color: const Color(0xFF009933),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    // Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFD9D9D9),
                        border: Border.all(color: Colors.white, width: 3),
                        image: const DecorationImage(
                          image: AssetImage('figma-uis/PROFILE.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Greeting
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
        // Menu card
        Positioned(
          top: 300,
          left: 30,
          right: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(27),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.person_outline,
                  label: 'Edit profile',
                  onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: Color(0xFFEBEDED),
                  thickness: 1,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.lock_outline,
                  label: 'Change password',
                  onTap: () => Navigator.pushNamed(context, '/change-password'),
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: Color(0xFFEBEDED),
                  thickness: 1,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.history,
                  label: 'History',
                  onTap: () => Navigator.pushNamed(context, '/history'),
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: Color(0xFFEBEDED),
                  thickness: 1,
                ),
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout
                  ? const Color(0xFFAC0000)
                  : const Color(0xFFA4A4A4),
              size: 22,
            ),
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
            Icon(Icons.chevron_right, color: const Color(0xFFA4A4A4), size: 24),
          ],
        ),
      ),
    );
  }
}
