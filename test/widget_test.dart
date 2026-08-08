import 'package:flutter_test/flutter_test.dart';

import 'package:darsgha/main.dart';

void main() {
  testWidgets('App launches and shows splash screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Darsgha'), findsOneWidget);
    expect(find.text('Smarter Institutions. Better Learning.'), findsOneWidget);

    // Let the splash screen's delayed navigation timer complete.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle(const Duration(milliseconds: 800));
  });
}
