import 'package:flutter_test/flutter_test.dart';

import 'package:swim_success_test_tasks/core/di/service_locator.dart';
import 'package:swim_success_test_tasks/main.dart';

void main() {
  testWidgets('shows pace selector and opens manual input', (
    WidgetTester tester,
  ) async {
    setupServiceLocator();

    await tester.pumpWidget(const MyApp());

    expect(find.text('Pace Selector'), findsOneWidget);
    expect(find.text('01'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);

    await tester.tap(find.text('01'));
    await tester.pump();

    expect(find.text('Enter your pace'), findsOneWidget);
  });
}
