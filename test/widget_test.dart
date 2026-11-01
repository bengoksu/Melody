import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:melody/main.dart';

void main() {
  testWidgets('Ana ekran ve detay geçişi çalışır', (tester) async {
    tester.view.physicalSize = const Size(390, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MelodyApp());

    expect(find.text('Melody.'), findsOneWidget);
    expect(find.text('Müziğin Ritmini\nKeşfet'), findsOneWidget);
    expect(find.text('Gitar'), findsOneWidget);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -550));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gitar'));
    await tester.pumpAndSettle();

    expect(find.text('Enstrüman Detayı'), findsOneWidget);
    expect(find.text('Gitar'), findsOneWidget);
  });
}
