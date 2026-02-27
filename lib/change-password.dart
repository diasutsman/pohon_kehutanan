import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_nav_scaffold.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPwController = TextEditingController();
  final _newPwController = TextEditingController();
  final _confirmPwController = TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPwController.dispose();
    _newPwController.dispose();
    _confirmPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      activeNavIndex: 4,
      body: Column(
        children: [
          // Green header
          Stack(
            children: [
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
                      image: AssetImage('figma-uis/PROFILE.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Change Password',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Form fields
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Current Password'),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    _currentPwController,
                    _obscureCurrent,
                    (v) => setState(() => _obscureCurrent = v),
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Change Password'),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    _newPwController,
                    _obscureNew,
                    (v) => setState(() => _obscureNew = v),
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Confirm Password'),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    _confirmPwController,
                    _obscureConfirm,
                    (v) => setState(() => _obscureConfirm = v),
                  ),
                  const SizedBox(height: 32),
                  // SAVE button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C7A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                        shadowColor: const Color(0x3F000000),
                      ),
                      child: Text(
                        'SAVE',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.lexend(
        color: const Color(0xFFC0C0C0),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    bool obscure,
    Function(bool) onToggle,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10.6,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: '***********',
          hintStyle: GoogleFonts.lexend(
            color: const Color(0xFF161414),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFFC0C0C0),
            ),
            onPressed: () => onToggle(!obscure),
          ),
        ),
      ),
    );
  }
}
