import 'package:flutter/material.dart';

import '../models/instrument.dart';

const _background = Color(0xFF141414);
const _card = Color(0xFF252525);
const _gold = Color(0xFFD9B779);
const _muted = Color(0xFFAAAAAA);

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cartItems});

  final List<Instrument> cartItems;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Instrument> get _uniqueCartItems {
    final uniqueItems = <Instrument>[];

    for (final instrument in widget.cartItems) {
      final alreadyAdded = uniqueItems.any(
        (item) => item.name == instrument.name,
      );

      if (!alreadyAdded) {
        uniqueItems.add(instrument);
      }
    }

    return uniqueItems;
  }

  int _quantityOf(Instrument instrument) {
    return widget.cartItems
        .where((item) => item.name == instrument.name)
        .length;
  }

  void _increaseQuantity(Instrument instrument) {
    setState(() {
      widget.cartItems.add(instrument);
    });
  }

  void _removeFromCart(Instrument instrument) {
    setState(() {
      widget.cartItems.removeWhere((item) => item.name == instrument.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uniqueCartItems = _uniqueCartItems;

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
          'Sepetim',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: uniqueCartItems.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: _gold,
                        size: 68,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Sepetiniz boş.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Alışverişe başlamak için bir enstrüman ekleyin.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _muted,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(22, 14, 22, 32),
                itemCount: uniqueCartItems.length,
                itemBuilder: (context, index) {
                  final instrument = uniqueCartItems[index];
                  final quantity = _quantityOf(instrument);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _card,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1EEE8),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Image.asset(
                            instrument.imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.music_note_rounded,
                                color: _gold,
                                size: 36,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                instrument.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                instrument.price,
                                style: const TextStyle(
                                  color: _gold,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    'Adet: $quantity',
                                    style: const TextStyle(
                                      color: _muted,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () =>
                                        _increaseQuantity(instrument),
                                    icon: const Icon(Icons.add_rounded),
                                    color: _gold,
                                    visualDensity: VisualDensity.compact,
                                    tooltip: 'Adedi artır',
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        _removeFromCart(instrument),
                                    icon: const Icon(Icons.delete_outline),
                                    color: _muted,
                                    visualDensity: VisualDensity.compact,
                                    tooltip: 'Sepetten sil',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
