import 'package:flutter/material.dart';

class InstrumentDetailScreen extends StatelessWidget {
  const InstrumentDetailScreen({super.key, required this.enstrumanAdi});

  final String enstrumanAdi;

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFD9B779);
    const card = Color(0xFF252525);

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          tooltip: 'Geri',
        ),
        title: const Text(
          'Enstrüman Detayı',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF38332B), card],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: gold.withValues(alpha: 0.11),
                        ),
                        child: const Icon(
                          Icons.music_note_rounded,
                          color: gold,
                          size: 82,
                        ),
                      ),
                    ),
                    const Positioned(left: 20, top: 20, child: _DetailLabel()),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Text(
                enstrumanAdi,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Müziğine karakter katacak seçkin bir enstrüman. '
                'Ürün bilgileri yakında burada yer alacak.',
                style: TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 15,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: gold),
                    SizedBox(width: 13),
                    Expanded(
                      child: Text(
                        'Detaylı ürün seçenekleri ve stok bilgisi daha sonra eklenecek.',
                        style: TextStyle(
                          color: Color(0xFFD1D1D1),
                          fontSize: 13,
                          height: 1.4,
                        ),
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
}

class _DetailLabel extends StatelessWidget {
  const _DetailLabel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFD9B779),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'MELODY SEÇKİSİ',
        style: TextStyle(
          color: Color(0xFF141414),
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
