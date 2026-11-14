import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:melody/main.dart';

void main() {
  testWidgets('Ana ekran, detay ve sepet geçişleri çalışır', (tester) async {
    tester.view.physicalSize = const Size(390, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MelodyApp());
    await tester.pumpAndSettle();

    expect(find.text('Melody.'), findsOneWidget);
    expect(find.text('Müziğin Ritmini\nKeşfet'), findsOneWidget);
    expect(find.text('Gitar'), findsOneWidget);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -550));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gitar'));
    await tester.pumpAndSettle();

    expect(find.text('Enstrüman Detayı'), findsOneWidget);
    expect(find.text('Gitar'), findsOneWidget);

    await tester.tap(find.text('Sepete Ekle'));
    await tester.tap(find.byTooltip('Geri'));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(CustomScrollView), const Offset(0, 700));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Sepet'));
    await tester.pumpAndSettle();

    expect(find.text('Sepetim'), findsOneWidget);
    expect(find.text('Gitar'), findsOneWidget);
    expect(find.text('₺18.990'), findsOneWidget);
    expect(find.text('Adet: 1'), findsOneWidget);

    await tester.tap(find.byTooltip('Adedi artır'));
    await tester.pump();
    expect(find.text('Adet: 2'), findsOneWidget);

    await tester.tap(find.byTooltip('Sepetten sil'));
    await tester.pump();
    expect(find.text('Sepetiniz boş.'), findsOneWidget);
  });
}
