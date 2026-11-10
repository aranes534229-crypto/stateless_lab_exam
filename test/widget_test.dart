// Widget test for the Campus Store shopping cart page.
// Verifies all expected texts are present and that every button
// produces the exact required debugPrint message. Runs on a small
// 320 x 640 phone screen to confirm no layout/overflow errors.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets(
    'Cart page shows all texts and correct button messages on 320x640 screen',
    (WidgetTester tester) async {
      // Set a small phone screen size (320 x 640).
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1.0;

      // Override debugPrint to capture console messages.
      final List<String> capturedMessages = [];
      void customDebugPrint(String? message, {int? wrapWidth}) {
        if (message != null) {
          capturedMessages.add(message);
        }
      }
      final originalDebugPrint = debugPrint;
      debugPrint = customDebugPrint;

      try {
        // Build the app and trigger a frame.
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // ---- Verify all expected texts are present ----
        expect(find.text('My Cart'), findsOneWidget);
        expect(find.text('Ready for checkout'), findsOneWidget);
        expect(find.text('Wireless Mouse'), findsOneWidget);
        expect(find.text('USB-C Hub'), findsOneWidget);
        expect(find.text('Laptop Stand'), findsOneWidget);
        expect(find.text('STUDENT10 applied'), findsOneWidget);
        expect(find.text('Payment Summary'), findsOneWidget);
        expect(find.text('PHP 1,850.00'), findsOneWidget);
        expect(find.text('Place Order'), findsOneWidget);

        // ---- Tap top-bar buttons ----
        await tester.tap(find.byIcon(Icons.arrow_back).first);
        await tester.pump();

        await tester.tap(find.byIcon(Icons.shopping_bag_outlined).first);
        await tester.pump();

        await tester.tap(find.text('Change'));
        await tester.pump();

        // ---- Scroll back up so product cards are visible ----
        await tester.scrollUntilVisible(
          find.text('Wireless Mouse'),
          0.0,
          scrollable: find.byType(Scrollable).first,
        );

        // ---- Tap plus, minus, and delete for each product ----
        final plusButtons = find.byIcon(Icons.add);
        for (int i = 0; i < plusButtons.evaluate().length; i++) {
          await tester.tap(plusButtons.at(i));
          await tester.pump();
        }

        final minusButtons = find.byIcon(Icons.remove);
        for (int i = 0; i < minusButtons.evaluate().length; i++) {
          await tester.tap(minusButtons.at(i));
          await tester.pump();
        }

        final deleteButtons = find.byIcon(Icons.delete_outline);
        for (int i = 0; i < deleteButtons.evaluate().length; i++) {
          await tester.tap(deleteButtons.at(i));
          await tester.pump();
        }

        // ---- Scroll down and tap Place Order ----
        await tester.scrollUntilVisible(
          find.text('Place Order'),
          500.0,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(find.text('Place Order'));
        await tester.pump();
      } finally {
        // Restore the original debugPrint.
        debugPrint = originalDebugPrint;
      }

      // ---- Verify captured messages match exactly ----
      expect(
        capturedMessages,
        equals(<String>[
          'Back clicked',
          'Cart clicked',
          'Change delivery address clicked',
          'Increase quantity: Wireless Mouse',
          'Increase quantity: USB-C Hub',
          'Increase quantity: Laptop Stand',
          'Decrease quantity: Wireless Mouse',
          'Decrease quantity: USB-C Hub',
          'Decrease quantity: Laptop Stand',
          'Remove item: Wireless Mouse',
          'Remove item: USB-C Hub',
          'Remove item: Laptop Stand',
          'Place order clicked! Total: PHP 1850.00',
        ]),
      );
    },
  );
}
