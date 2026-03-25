import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:yellow_grapes_landing/site_app.dart';
import 'package:yellow_grapes_landing/site_content.dart';

void _setDesktopViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(1440, 1800);
  tester.view.devicePixelRatio = 1.0;
}

void main() {
  testWidgets('home route renders desktop hero and developer panel', (
    WidgetTester tester,
  ) async {
    _setDesktopViewport(tester);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const YellowGrapesWebApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text(appName), findsWidgets);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('繁體中文'), findsOneWidget);
    expect(find.text('Taiwan wine map'), findsNothing);
    expect(
      find.text('Taiwan-focused wine map and business directory.'),
      findsNothing,
    );
    expect(find.text('Taiwan-focused wine discovery platform'), findsNothing);
    expect(find.text(appTagline), findsOneWidget);
    expect(find.text('Contact / Learn More'), findsNothing);
    expect(find.text('View Privacy Policy'), findsNothing);
    expect(
      find.text(
        'Yellow Grapes is a dedicated platform designed to map and explore the rich landscape of wine merchants and culture in Taiwan. Our mission is to bridge the gap between wine enthusiasts and local merchants through intuitive, data-driven exploration.',
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'Yellow Grapes 是一款以台灣為核心的葡萄酒地圖應用程式，協助使用者在同一個平台探索酒吧、餐廳、自帶酒餐廳、酒商、量販、酒莊、儲酒服務與葡萄酒教育資源。',
      ),
      findsNothing,
    );
    expect(
      find.textContaining('Yellow Grapes is an information platform only.'),
      findsOneWidget,
    );
    expect(find.text('Main coverage'), findsNothing);
    expect(find.text('Developer Information'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(
      find.text(
        'Yellow Grapes is proudly developed and maintained by Torsade Technology Limited Company.',
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'For inquiries regarding the app, partnerships, or support, please contact our team at:',
      ),
      findsOneWidget,
    );
    expect(find.text('Email: mchou@torsade.com.tw'), findsOneWidget);
    expect(
      find.text('Headquarters: New Taipei City, Taiwan'),
      findsOneWidget,
    );
    expect(find.text('wine bars'), findsOneWidget);
    expect(find.text('restaurants'), findsOneWidget);
    expect(find.text('byo restaurants'), findsOneWidget);
    expect(find.text('bottle shops'), findsOneWidget);
    expect(find.text('hypermarkets'), findsOneWidget);
    expect(find.text('wineries'), findsOneWidget);
    expect(find.text('wine storage'), findsOneWidget);
    expect(find.text('wine education'), findsOneWidget);
    expect(find.text('© 2026 $companyName.'), findsOneWidget);
    expect(find.text('All rights reserved.'), findsOneWidget);
    expect(find.text('Wine Bars'), findsWidgets);
  });

  testWidgets('privacy route renders page content and shared footer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const YellowGrapesWebApp(initialRoute: '/privacy'));
    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);
    expect(find.text('繁體中文'), findsOneWidget);
    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.text('© 2026 $companyName.'), findsOneWidget);
    expect(find.text('All rights reserved.'), findsOneWidget);
    expect(find.text('1. Scope and Operator'), findsOneWidget);
    expect(find.text('1. 適用範圍與營運者'), findsNothing);
  });

  testWidgets('terms route renders page content and shared footer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const YellowGrapesWebApp(initialRoute: '/terms'));
    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);
    expect(find.text('繁體中文'), findsOneWidget);
    expect(find.text('Terms of Service'), findsOneWidget);
    expect(find.text('© 2026 $companyName.'), findsOneWidget);
    expect(find.text('All rights reserved.'), findsOneWidget);
    expect(find.text('2. Nature of the Service'), findsOneWidget);
    expect(find.text('2. 服務性質'), findsNothing);
  });
}
