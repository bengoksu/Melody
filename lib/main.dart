import 'package:flutter/material.dart';

void main() {
  runApp(const MelodyApp());
}

class MelodyApp extends StatelessWidget {
  const MelodyApp({super.key});

  static const List<String> enstrumanlar = [
    'Gitar',
    'Piyano',
    'Keman',
    'Bateri',
    'Flüt',
    'Ukulele',
    'Saksafon',
    'Çello',
    'Klarnet',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF141414),

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFD9B779),
          title: const Text(
            'Melody',
            style: TextStyle(
              color: Color(0xFF141414),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Müziğin Ritmini Keşfet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Hayalindeki enstrümanı bul',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 450,
                child: GridView.builder(
                  itemCount: enstrumanlar.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF252525),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        enstrumanlar[index],
                        style: TextStyle(
                          color: Color(0xFFD9B779),
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
