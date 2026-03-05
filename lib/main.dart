import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome.dart';
import 'login.dart';
import 'signin.dart';
import 'scan.dart';
import 'deskripsi-tanaman.dart';
import 'ai-page.dart';
import 'ai-page-chat.dart';
import 'history.dart';
import 'profile.dart';
import 'change-password.dart';
import 'detail-profile-name.dart';
import 'bottom_nav_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pohon Kehutanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009933),
          primary: const Color(0xFF009933),
        ),
        textTheme: GoogleFonts.lexendTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signin': (context) => const SignInPage(),
        '/home': (context) => const BottomNavScaffold(),
        '/scan': (context) => const ScanPage(),
        '/deskripsi': (context) => const DeskripsiTanamanPage(),
        '/ai': (context) => const AiPage(),
        // '/ai-chat': (context) => const AiPageChat(),
        '/history': (context) => const HistoryPage(),
        '/profile': (context) => const ProfilePage(),
        '/change-password': (context) => const ChangePasswordPage(),
        '/edit-profile': (context) => const DetailProfileNamePage(),
      },
    );
  }
}
