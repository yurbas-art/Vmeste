// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:vmeste/app.dart';

void main() {
  testWidgets('welcome screen opens the app flow', (WidgetTester tester) async {
    await tester.pumpWidget(const VmesteApp());

    expect(find.text('Выберем фильм вместе'), findsOneWidget);
    expect(find.text('Продолжить'), findsOneWidget);

    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(find.text('Что смотрим сегодня?'), findsOneWidget);
  });
}
