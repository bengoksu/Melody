import 'package:flutter/material.dart';

import '../models/instrument.dart';

const _background = Color(0xFF141414);
const _card = Color(0xFF252525);
const _gold = Color(0xFFD9B779);
const _muted = Color(0xFFAAAAAA);

class InstrumentDetailScreen extends StatelessWidget {
  const InstrumentDetailScreen({
    super.key,
    required this.instrument,
    required this.onAddToCart,
  });

  final Instrument instrument;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
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
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1EEE8),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Image.asset(
                  instrument.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.music_note_rounded,
                      color: _gold,
                      size: 82,
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      instrument.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    instrument.price,
                    style: const TextStyle(
                      color: _gold,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF353535)),
                ),
                child: Text(
                  instrument.category,
                  style: const TextStyle(
                    color: _gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Açıklama',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                instrument.description,
                style: const TextStyle(
                  color: _muted,
                  fontSize: 15,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    onAddToCart();
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Sepete eklendi.'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: _card,
                        ),
                      );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text('Sepete Ekle'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gold,
                    foregroundColor: _background,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
