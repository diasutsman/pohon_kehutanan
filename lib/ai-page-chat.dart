import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiPageChat extends StatefulWidget {
  const AiPageChat({super.key});

  @override
  State<AiPageChat> createState() => _AiPageChatState();
}

class _AiPageChatState extends State<AiPageChat> {
  final _messageController = TextEditingController();
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: 'Halo saya ingin melihat ada berapa jenis\npohon di wilayah ini?',
      isUser: true,
    ),
    _ChatMessage(
      text:
          'Baik, saya akan membantu anda untuk\nmengetahui berapa jenis pohon yang ada\ndi wilayah ini.',
      isUser: false,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.5, 0.36),
            end: Alignment(0.5, 1.0),
            colors: [Color(0xFFEBEDED), Color(0xFFD4E8D9)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Top bar: back + avatar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
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
                    Container(
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
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Chat messages
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final msg = _messages[index];
                    return _buildChatBubble(msg);
                  },
                ),
              ),
              // Center watermark
              Icon(
                Icons.park_outlined,
                size: 80,
                color: Colors.grey.withValues(alpha: 0.12),
              ),
              const Spacer(),
              // Plant cards (horizontal scroll)
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) => _buildPlantCard(),
                ),
              ),
              const SizedBox(height: 12),
              // Input bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ).copyWith(bottom: 20),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: _messageController,
                          style: GoogleFonts.lexend(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Ask me anything...',
                            hintStyle: GoogleFonts.lexend(
                              color: const Color(0xFFA7A7A7),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xFF009933),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(_ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: msg.isUser ? const Color(0xFFD9D9D9) : const Color(0xFFD4E0D9),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          msg.text,
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildPlantCard() {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'figma-uis/DESKRIPSI TANAMAN.png',
              width: 43,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 43,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A7C2E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_florist,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Billenia indica L',
                  style: GoogleFonts.lexend(
                    color: const Color(0xFF009933),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Habitat Alami tumbuh subur di lingkungan lembab dan dekat...',
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
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  _ChatMessage({required this.text, required this.isUser});
}
