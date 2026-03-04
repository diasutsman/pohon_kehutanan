import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_nav_scaffold.dart';

class DetailProfileNamePage extends StatefulWidget {
  const DetailProfileNamePage({super.key});

  @override
  State<DetailProfileNamePage> createState() => _DetailProfileNamePageState();
}

class _DetailProfileNamePageState extends State<DetailProfileNamePage> {
  final _nameController = TextEditingController(text: 'Albert Ricia');
  final _phoneController = TextEditingController(text: '0821 5635 6563');
  final _emailController = TextEditingController(text: 'Albert@gmail.com');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
                      image: AssetImage('assets/images/pp.png'),
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
                'Edit Profile',
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
                  _buildLabel('Change Name'),
                  const SizedBox(height: 8),
                  _buildEditField(_nameController),
                  const SizedBox(height: 20),
                  _buildLabel('Change Number'),
                  const SizedBox(height: 8),
                  _buildEditField(_phoneController),
                  const SizedBox(height: 20),
                  _buildLabel('Change Email'),
                  const SizedBox(height: 8),
                  _buildEditField(_emailController),
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

  Widget _buildEditField(TextEditingController controller) {
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
        style: GoogleFonts.lexend(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF161414),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFC0C0C0), size: 22),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
