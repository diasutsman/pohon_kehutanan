import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map.dart' as app_map;
import 'ai-page.dart';
import 'deskripsi-tanaman.dart';
import 'profile.dart';

class BottomNavScaffold extends StatefulWidget {
  const BottomNavScaffold({super.key});

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    app_map.MapPage(),
    AiPage(),
    SizedBox(), // Placeholder for SCAN center
    DeskripsiTanamanPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      extendBody: true,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scan');
          },
          backgroundColor: const Color(0xFF009933),
          elevation: 4,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
              const SizedBox(height: 2),
              Text(
                'SCAN',
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 70,
        padding: EdgeInsets.zero,
        color: Colors.white,
        elevation: 8,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.auto_awesome, 'AI', 1),
            const SizedBox(width: 56), // Space for FAB
            _buildNavItem(Icons.park, 'Pohon', 3),
            _buildNavItem(Icons.person, 'Profil', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    final color = isActive ? const Color(0xFF009933) : const Color(0xFFBBBBBB);
    return InkWell(
      onTap: () {
        if (index == 1) {
          // AI button navigates to the AI page
          Navigator.pushNamed(context, '/ai');
        } else if (index == 3) {
          // Pohon button disabled — do nothing
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.lexend(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Standalone bottom nav bar for pages that are pushed on top (like History, ChangePassword, etc.)
class AppBottomNavBar extends StatelessWidget {
  final int activeIndex;
  const AppBottomNavBar({super.key, this.activeIndex = -1});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      padding: EdgeInsets.zero,
      color: Colors.white,
      elevation: 8,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, 'Home', 0),
          _buildNavItem(context, Icons.auto_awesome, 'AI', 1),
          const SizedBox(width: 56),
          _buildNavItem(context, Icons.park, 'Pohon', 3),
          _buildNavItem(context, Icons.person, 'Profil', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final isActive = activeIndex == index;
    final color = isActive ? const Color(0xFF009933) : const Color(0xFFBBBBBB);
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.lexend(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom nav bar with a centered SCAN FAB for sub-pages
class SubPageScaffold extends StatelessWidget {
  final Widget body;
  final int activeNavIndex;
  const SubPageScaffold({
    super.key,
    required this.body,
    this.activeNavIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      extendBody: true,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scan');
          },
          backgroundColor: const Color(0xFF009933),
          elevation: 4,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
              const SizedBox(height: 2),
              Text(
                'SCAN',
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomNavBar(activeIndex: activeNavIndex),
    );
  }
}
