import 'package:flutter/material.dart';

class InstrumentDetailScreen extends StatelessWidget {
  final String enstrumanAdi;

  const InstrumentDetailScreen({super.key, required this.enstrumanAdi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('Enstrüman Detayı'),
        centerTitle: true,
        backgroundColor: const Color(0xFFD9B779),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(
        child: Text(
          '$enstrumanAdi Detayı',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
