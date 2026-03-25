import 'package:flutter_test/flutter_test.dart';
import 'package:yellow_grapes_landing/site_app.dart';
import 'package:yellow_grapes_landing/site_content.dart';

void main() {
  testWidgets('home route shows hero, compliance text, CTA, and copyright', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const YellowGrapesWebApp());
    await tester.pumpAndSettle();

    expect(find.text(appName), findsWidgets);
    expect(find.text(appTagline), findsOneWidget);
    expect(find.text('Contact / Learn More'), findsWidgets);
    expect(
      find.textContaining('Yellow Grapes is an information platform only.'),
      findsOneWidget,
    );
    expect(find.text(companyCopyright), findsOneWidget);
    expect(find.text('Wine Bars'), findsOneWidget);
  });

  testWidgets('privacy route renders page content and shared footer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const YellowGrapesWebApp(initialRoute: '/privacy'));
    await tester.pumpAndSettle();

    expect(find.text('Privacy Policy / 隱私權政策'), findsOneWidget);
    expect(find.text(companyCopyright), findsOneWidget);
    expect(find.text('1. Scope and Operator'), findsOneWidget);
    expect(find.text('1. 適用範圍與營運者'), findsOneWidget);
  });

  testWidgets('terms route renders page content and shared footer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const YellowGrapesWebApp(initialRoute: '/terms'));
    await tester.pumpAndSettle();

    expect(find.text('Terms of Service / 服務條款'), findsOneWidget);
    expect(find.text(companyCopyright), findsOneWidget);
    expect(find.text('2. Nature of the Service'), findsOneWidget);
    expect(find.text('2. 服務性質'), findsOneWidget);
  });
}
