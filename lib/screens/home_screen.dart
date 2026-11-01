import 'package:flutter/material.dart';

import 'instrument_detail_screen.dart';

const _background = Color(0xFF141414);
const _card = Color(0xFF252525);
const _gold = Color(0xFFD9B779);
const _muted = Color(0xFFAAAAAA);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Tümü';
  String _searchText = '';

  static const _categories = ['Tümü', 'Telli', 'Tuşlu', 'Vurmalı', 'Nefesli'];
  static const _instruments = [
    Instrument(
      'Gitar',
      'Telli',
      '₺18.990',
      'assets/images/guitar.png',
      Icons.music_note_rounded,
    ),
    Instrument(
      'Piyano',
      'Tuşlu',
      '₺64.500',
      'assets/images/piano.jpg',
      Icons.piano_rounded,
    ),
    Instrument(
      'Keman',
      'Telli',
      '₺12.750',
      'assets/images/violin.png',
      Icons.graphic_eq_rounded,
    ),
    Instrument(
      'Bateri',
      'Vurmalı',
      '₺42.900',
      'assets/images/drums.jpg',
      Icons.album_rounded,
    ),
    Instrument(
      'Flüt',
      'Nefesli',
      '₺6.490',
      'assets/images/flute.jpg',
      Icons.linear_scale_rounded,
    ),
    Instrument(
      'Ukulele',
      'Telli',
      '₺4.250',
      'assets/images/ukulele.jpg',
      Icons.music_note_rounded,
    ),
    Instrument(
      'Saksafon',
      'Nefesli',
      '₺31.800',
      'assets/images/saxophone.jpg',
      Icons.queue_music_rounded,
    ),
    Instrument(
      'Çello',
      'Telli',
      '₺39.900',
      'assets/images/cello.png',
      Icons.graphic_eq_rounded,
    ),
    Instrument(
      'Klarnet',
      'Nefesli',
      '₺14.600',
      'assets/images/clarinet.jpg',
      Icons.linear_scale_rounded,
    ),
  ];

  List<Instrument> get _filteredInstruments => _instruments.where((instrument) {
    final matchesCategory =
        _selectedCategory == 'Tümü' || instrument.category == _selectedCategory;
    final matchesSearch = instrument.name.toLowerCase().contains(
      _searchText.trim().toLowerCase(),
    );
    return matchesCategory && matchesSearch;
  }).toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openDetail(Instrument instrument) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InstrumentDetailScreen(enstrumanAdi: instrument.name),
      ),
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$feature özelliği yakında eklenecek.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: _card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final side = constraints.maxWidth < 380 ? 16.0 : 22.0;
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(side, 10, side, 0),
                      sliver: SliverToBoxAdapter(
                        child: _TopBar(onUnavailableTap: _showComingSoon),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(side, 30, side, 0),
                      sliver: const SliverToBoxAdapter(child: _WelcomeArea()),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(side, 24, side, 0),
                      sliver: const SliverToBoxAdapter(child: _PromoBanner()),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(side, 22, side, 0),
                      sliver: SliverToBoxAdapter(
                        child: _SearchField(
                          controller: _searchController,
                          onChanged: (value) =>
                              setState(() => _searchText = value),
                          onClear: () {
                            _searchController.clear();
                            setState(() => _searchText = '');
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: _CategoryList(
                          categories: _categories,
                          selectedCategory: _selectedCategory,
                          sidePadding: side,
                          onSelected: (value) =>
                              setState(() => _selectedCategory = value),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(side, 27, side, 14),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            const Text(
                              'Enstrümanlar',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${_filteredInstruments.length} ürün',
                              style: const TextStyle(
                                color: _muted,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_filteredInstruments.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: _EmptyResult(),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(side, 0, side, 32),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 14,
                                childAspectRatio: constraints.maxWidth < 360
                                    ? 0.68
                                    : 0.74,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final instrument = _filteredInstruments[index];
                            return _InstrumentCard(
                              instrument: instrument,
                              onTap: () => _openDetail(instrument),
                            );
                          }, childCount: _filteredInstruments.length),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onUnavailableTap});
  final ValueChanged<String> onUnavailableTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Melody.',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.1,
            ),
          ),
        ),
        _HeaderButton(
          icon: Icons.favorite_border_rounded,
          tooltip: 'Favoriler (yakında)',
          onTap: () => onUnavailableTap('Favoriler'),
        ),
        const SizedBox(width: 10),
        _HeaderButton(
          icon: Icons.shopping_bag_outlined,
          tooltip: 'Sepet (yakında)',
          onTap: () => onUnavailableTap('Sepet'),
        ),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(width: 44, height: 44, child: Icon(icon, size: 21)),
        ),
      ),
    );
  }
}

class _WelcomeArea extends StatelessWidget {
  const _WelcomeArea();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Müziğin Ritmini\nKeşfet',
          style: TextStyle(
            fontSize: 30,
            height: 1.08,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.2,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Hayalindeki enstrümanı bul',
          style: TextStyle(color: _muted, fontSize: 16),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF3B3225), Color(0xFF211E19)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: _gold.withValues(alpha: 0.22)),
      ),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: _gold,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text(
                      'MELODY SEÇKİSİ',
                      style: TextStyle(
                        color: _background,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'En iyi enstrümanlar burada',
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: 'Enstrüman ara...',
        hintStyle: const TextStyle(color: Color(0xFF777777)),
        prefixIcon: const Icon(Icons.search_rounded, color: _muted),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: onClear,
                icon: const Icon(Icons.close_rounded),
                color: _muted,
                tooltip: 'Aramayı temizle',
              ),
        filled: true,
        fillColor: _card,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: Color(0xFF303030)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: _gold, width: 1.2),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    required this.categories,
    required this.selectedCategory,
    required this.sidePadding,
    required this.onSelected,
  });
  final List<String> categories;
  final String selectedCategory;
  final double sidePadding;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category == selectedCategory;
          return ChoiceChip(
            label: Text(category),
            selected: selected,
            onSelected: (_) => onSelected(category),
            showCheckmark: false,
            labelStyle: TextStyle(
              color: selected ? _background : const Color(0xFFC7C7C7),
              fontSize: 13,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
            selectedColor: _gold,
            backgroundColor: _card,
            side: BorderSide(color: selected ? _gold : const Color(0xFF303030)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}

class _InstrumentCard extends StatelessWidget {
  const _InstrumentCard({required this.instrument, required this.onTap});
  final Instrument instrument;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _card,
      borderRadius: BorderRadius.circular(21),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1EEE8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            instrument.imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  instrument.icon,
                                  size: 43,
                                  color: _gold,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          color: Color(0xFF8D8D8D),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 12, 4, 2),
                child: Text(
                  instrument.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 5),
                child: Text(
                  instrument.price,
                  maxLines: 1,
                  style: const TextStyle(
                    color: _gold,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
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

class _EmptyResult extends StatelessWidget {
  const _EmptyResult();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, color: _muted, size: 42),
          SizedBox(height: 12),
          Text(
            'Aramana uygun enstrüman bulunamadı.',
            textAlign: TextAlign.center,
            style: TextStyle(color: _muted, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class Instrument {
  const Instrument(
    this.name,
    this.category,
    this.price,
    this.imagePath,
    this.icon,
  );
  final String name;
  final String category;
  final String price;
  final String imagePath;
  final IconData icon;
}
