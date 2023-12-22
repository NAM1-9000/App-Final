import 'package:final22735/presentation/screens/q2_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('Q2UI Test', (tester) async {
    const widget = MaterialApp(
      home: Q2UI(),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Q2UI Screenshot');
  });
}
