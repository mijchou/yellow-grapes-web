import 'package:flutter/material.dart';

import 'open_external_link_stub.dart'
    if (dart.library.html) 'open_external_link_web.dart';
import 'site_content.dart';

class YellowGrapesWebApp extends StatelessWidget {
  const YellowGrapesWebApp({super.key, this.initialRoute});

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: initialRoute ?? '/',
      onGenerateRoute: (RouteSettings settings) {
        final String routeName = _normalizeRoute(settings.name);
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) {
            switch (routeName) {
              case '/privacy':
                return const _SiteScaffold(
                  child: _LegalPage(
                    title: 'Privacy Policy',
                    subtitle:
                        'Yellow Grapes mobile application and related services',
                    sections: privacySections,
                  ),
                );
              case '/terms':
                return const _SiteScaffold(
                  child: _LegalPage(
                    title: 'Terms of Service',
                    subtitle:
                        'Operating terms for Yellow Grapes and related services',
                    sections: termsSections,
                  ),
                );
              case '/':
              default:
                return const _SiteScaffold(child: _HomePage());
            }
          },
        );
      },
    );
  }

  ThemeData _buildTheme() {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(
          seedColor: _SitePalette.brand,
          brightness: Brightness.light,
        ).copyWith(
          primary: _SitePalette.brand,
          onPrimary: _SitePalette.ink,
          secondary: _SitePalette.mutedText,
          surface: _SitePalette.surface,
          onSurface: _SitePalette.ink,
          outline: _SitePalette.outline,
          outlineVariant: _SitePalette.outlineSoft,
          tertiary: _SitePalette.bordeaux,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _SitePalette.surface,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 54,
          fontWeight: FontWeight.w700,
          height: 1.05,
          letterSpacing: -1.6,
          color: _SitePalette.bordeaux,
        ),
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.15,
          letterSpacing: -0.8,
          color: _SitePalette.bordeaux,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: _SitePalette.ink,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.25,
          color: _SitePalette.ink,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: _SitePalette.ink,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.6,
          color: _SitePalette.mutedText,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: _SitePalette.ink,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: const BorderSide(color: _SitePalette.outlineSoft),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _SitePalette.brand,
          foregroundColor: _SitePalette.ink,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _SitePalette.ink,
          side: const BorderSide(color: _SitePalette.outline),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}

String _normalizeRoute(String? rawRoute) {
  if (rawRoute == null || rawRoute.isEmpty) {
    return '/';
  }

  final Uri uri = Uri.parse(rawRoute);
  final String path = uri.path.isEmpty ? '/' : uri.path;
  switch (path) {
    case '/privacy':
      return '/privacy';
    case '/terms':
      return '/terms';
    case '/':
    default:
      return '/';
  }
}

class _SiteScaffold extends StatelessWidget {
  const _SiteScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: _SitePalette.surface,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const _SiteHeader(),
              Expanded(child: child),
              const _SiteFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SiteHeader extends StatelessWidget {
  const _SiteHeader();

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 860;
    final Widget title = Text(
      appName,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: _SitePalette.bordeaux,
        fontWeight: FontWeight.w700,
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
      decoration: const BoxDecoration(
        color: _SitePalette.surface,
        border: Border(bottom: BorderSide(color: Colors.transparent)),
      ),
      child: _Shell(
        child: compact
            ? Column(
                children: <Widget>[
                  title,
                  const SizedBox(height: 12),
                  const _LanguageSwitch(),
                ],
              )
            : SizedBox(
                height: 44,
                child: Stack(
                  children: const <Widget>[
                    Align(alignment: Alignment.center, child: _HeaderTitle()),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _LanguageSwitch(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: _SitePalette.bordeaux,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _LanguageSwitch extends StatelessWidget {
  const _LanguageSwitch();

  @override
  Widget build(BuildContext context) {
    final TextStyle activeStyle = Theme.of(context).textTheme.labelLarge!
        .copyWith(color: _SitePalette.ink, fontWeight: FontWeight.w700);
    final TextStyle inactiveStyle = Theme.of(context).textTheme.labelLarge!
        .copyWith(color: const Color(0xFF9D9890), fontWeight: FontWeight.w600);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 4),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: _SitePalette.ink, width: 2),
            ),
          ),
          child: Text('English', style: activeStyle),
        ),
        const SizedBox(width: 12),
        Text('/', style: inactiveStyle),
        const SizedBox(width: 12),
        Text('繁體中文', style: inactiveStyle),
      ],
    );
  }
}

class _FooterTextBlock extends StatelessWidget {
  const _FooterTextBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          appName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: _SitePalette.footerText,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '© 2026 $companyName.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: _SitePalette.footerText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'All rights reserved.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: _SitePalette.footerText,
          ),
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _FooterLink(
          label: 'Home',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/'),
        ),
        const SizedBox(height: 8),
        _FooterLink(
          label: 'Privacy',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/privacy'),
        ),
        const SizedBox(height: 8),
        _FooterLink(
          label: 'Terms',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/terms'),
        ),
        const SizedBox(height: 8),
        _FooterLink(
          label: 'contact@yellowgrapes.app',
          onTap: (_) => openExternalLink(supportMailtoUrl),
        ),
      ],
    );
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Yellow Grapes is an information platform only and does not facilitate alcohol sales. Please drink responsibly.',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: _SitePalette.footerText,
      ),
    );
  }
}

class _SiteFooter extends StatelessWidget {
  const _SiteFooter();

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 860;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      decoration: const BoxDecoration(
        color: _SitePalette.footerBackground,
        border: Border(top: BorderSide(color: Colors.transparent)),
      ),
      child: _Shell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            compact
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _FooterTextBlock(),
                      SizedBox(height: 16),
                      _FooterLinks(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: _FooterTextBlock()),
                      _FooterLinks(),
                    ],
                  ),
            const SizedBox(height: 16),
            const _FooterNote(),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
      child: _Shell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _HeroSection(),
            const SizedBox(height: 28),
            _Section(
              eyebrow: 'Merchant Coverage',
              title: 'Wine-related businesses, organized for exploration',
              child: const _MerchantCategoryGrid(),
            ),
            const SizedBox(height: 28),
            _Section(
              eyebrow: 'Core Features',
              title:
                  'Built to help people discover, compare, and stay informed',
              child: const _FeatureGrid(),
            ),
            const SizedBox(height: 28),
            const _ComplianceStrip(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  static const double _desktopStageHeight = 540;

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 920;

    final Widget intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          appTagline,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(
            color: _SitePalette.ink,
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Yellow Grapes is a dedicated platform designed to map and explore the rich landscape of wine merchants and culture in Taiwan. Our mission is to bridge the gap between wine enthusiasts and local merchants through intuitive, data-driven exploration.',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: _SitePalette.ink),
        ),
      ],
    );

    final Widget developerPanel = Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFFFFFDF6), Colors.white],
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 28,
              offset: Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Developer Information',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: _SitePalette.ink),
            ),
            const SizedBox(height: 10),
            const _BulletLine(
              text:
                  'Yellow Grapes is proudly developed and maintained by Torsade Technology Limited Company.',
            ),
            const SizedBox(height: 18),
            const Divider(color: _SitePalette.outlineSoft),
            const SizedBox(height: 14),
            Text(
              'Contact Us',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: _SitePalette.ink),
            ),
            const SizedBox(height: 10),
            Text(
              'For inquiries regarding the app, partnerships, or support, please contact our team at:',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: mchou@torsade.com.tw',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _SitePalette.ink,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Headquarters: New Taipei City, Taiwan',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _SitePalette.ink,
              ),
            ),
          ],
        ),
      ),
    );

    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFFFFFDF8), Colors.white],
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 28,
              offset: Offset(0, 16),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Opacity(
                opacity: 0.22,
                child: const _MockMapBackground(),
              ),
            ),
            if (compact)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 220),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 460),
                        child: intro,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.center,
                    child: _HeroMarkerCluster(compact: true),
                  ),
                  const SizedBox(height: 28),
                  developerPanel,
                ],
              )
            else
              SizedBox(
                height: _desktopStageHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 460),
                          child: intro,
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                    const SizedBox(
                      width: 228,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: _HeroMarkerCluster(compact: false),
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                    Expanded(flex: 5, child: developerPanel),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeroMarkerCluster extends StatelessWidget {
  const _HeroMarkerCluster({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final List<Widget> markerTiles = merchantCategories
        .take(8)
        .map(
          (MerchantCategory category) => _HeroMapMarker(
            label: category.englishName.toLowerCase(),
            icon: category.icon,
            color: category.color,
          ),
        )
        .toList();

    if (compact) {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 18,
        runSpacing: 18,
        children: markerTiles,
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 18,
      children: markerTiles,
    );
  }
}

class _HeroMapMarker extends StatelessWidget {
  const _HeroMapMarker({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 11,
              color: _SitePalette.ink,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x18000000),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

class _MockMapBackground extends StatelessWidget {
  const _MockMapBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _MockMapPainter());
  }
}

class _MockMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint areaPaint =
        Paint()..color = const Color(0xFFD7E4D8).withValues(alpha: 0.75);
    final Paint accentAreaPaint =
        Paint()..color = const Color(0xFFE9E1C7).withValues(alpha: 0.8);
    final Paint roadPaint =
        Paint()
          ..color = const Color(0xFFB9C0BC).withValues(alpha: 0.9)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.2;
    final Paint minorRoadPaint =
        Paint()
          ..color = const Color(0xFFC8CDC9).withValues(alpha: 0.75)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6;

    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.04, size.height * 0.08, size.width * 0.2, size.height * 0.16),
      areaPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.55, size.height * 0.1, size.width * 0.18, size.height * 0.14),
      accentAreaPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.18, size.height * 0.58, size.width * 0.24, size.height * 0.18),
      accentAreaPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.7, size.height * 0.55, size.width * 0.18, size.height * 0.2),
      areaPaint,
    );

    final Path mainRoadA =
        Path()
          ..moveTo(-20, size.height * 0.22)
          ..quadraticBezierTo(
            size.width * 0.18,
            size.height * 0.08,
            size.width * 0.42,
            size.height * 0.18,
          )
          ..quadraticBezierTo(
            size.width * 0.72,
            size.height * 0.3,
            size.width + 20,
            size.height * 0.18,
          );
    final Path mainRoadB =
        Path()
          ..moveTo(size.width * 0.1, -20)
          ..quadraticBezierTo(
            size.width * 0.18,
            size.height * 0.22,
            size.width * 0.16,
            size.height * 0.44,
          )
          ..quadraticBezierTo(
            size.width * 0.12,
            size.height * 0.72,
            size.width * 0.26,
            size.height + 20,
          );
    final Path mainRoadC =
        Path()
          ..moveTo(size.width * 0.46, -20)
          ..quadraticBezierTo(
            size.width * 0.54,
            size.height * 0.18,
            size.width * 0.52,
            size.height * 0.4,
          )
          ..quadraticBezierTo(
            size.width * 0.5,
            size.height * 0.72,
            size.width * 0.62,
            size.height + 20,
          );

    canvas.drawPath(mainRoadA, roadPaint);
    canvas.drawPath(mainRoadB, roadPaint);
    canvas.drawPath(mainRoadC, roadPaint);

    canvas.drawLine(
      Offset(size.width * 0.08, size.height * 0.38),
      Offset(size.width * 0.9, size.height * 0.42),
      minorRoadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.22, size.height * 0.74),
      Offset(size.width * 0.82, size.height * 0.66),
      minorRoadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.62, size.height * 0.16),
      Offset(size.width * 0.84, size.height * 0.76),
      minorRoadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MerchantCategoryGrid extends StatelessWidget {
  const _MerchantCategoryGrid();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final int crossAxisCount = width >= 1180
        ? 4
        : width >= 860
        ? 3
        : width >= 560
        ? 2
        : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: merchantCategories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: crossAxisCount == 1
            ? 1.55
            : crossAxisCount == 2
            ? 1.08
            : crossAxisCount == 3
            ? 0.88
            : 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        final MerchantCategory category = merchantCategories[index];
        return Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: category.color.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Icon(category.icon, color: _SitePalette.ink),
                ),
                const SizedBox(height: 16),
                Text(
                  category.englishName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  category.englishDescription,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid();

  @override
  Widget build(BuildContext context) {
    final bool stacked = MediaQuery.sizeOf(context).width < 920;
    if (stacked) {
      return Column(
        children: featureHighlights
            .map(
              (FeatureHighlight highlight) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _FeatureCard(highlight: highlight),
              ),
            )
            .toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: featureHighlights
          .map(
            (FeatureHighlight highlight) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: highlight == featureHighlights.last ? 0 : 16,
                ),
                child: _FeatureCard(highlight: highlight),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.highlight});

  final FeatureHighlight highlight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5C0),
                borderRadius: BorderRadius.zero,
              ),
              child: Icon(highlight.icon, color: _SitePalette.bordeaux),
            ),
            const SizedBox(height: 18),
            Text(
              highlight.eyebrow,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: _SitePalette.bordeaux),
            ),
            const SizedBox(height: 8),
            Text(
              highlight.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              highlight.englishDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComplianceStrip extends StatelessWidget {
  const _ComplianceStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3D1),
        borderRadius: BorderRadius.zero,
        border: Border.all(color: const Color(0xFFF4D572)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Platform and alcohol-related notice',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: _SitePalette.bordeaux),
          ),
          const SizedBox(height: 12),
          Text(
            'Yellow Grapes is an information platform only. We do not sell alcohol. Users must be of legal drinking age (18 in Taiwan) to access alcohol-related content. Please drink responsibly.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: _SitePalette.ink),
          ),
        ],
      ),
    );
  }
}

class _LegalPage extends StatelessWidget {
  const _LegalPage({
    required this.title,
    required this.subtitle,
    required this.sections,
  });

  final String title;
  final String subtitle;
  final List<LegalSection> sections;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
      child: _Shell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFFFFDF8), Colors.white],
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 28,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      subtitle,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: _SitePalette.ink),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: const <Widget>[
                        _MetaChip(label: 'Operator', value: companyName),
                        _MetaChip(label: 'Contact', value: supportEmail),
                        _MetaChip(
                          label: 'Effective Date',
                          value: effectiveDateEnglish,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            ...sections.map(
              (LegalSection section) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _LegalSectionCard(section: section),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegalSectionCard extends StatelessWidget {
  const _LegalSectionCard({required this.section});

  final LegalSection section;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              section.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: _SitePalette.bordeaux),
            ),
            const SizedBox(height: 12),
            Text(
              section.englishBody,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: _SitePalette.ink),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5C0),
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: _SitePalette.bordeaux),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _SitePalette.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.eyebrow,
    required this.title,
    required this.child,
  });

  final String eyebrow;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          eyebrow,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: _SitePalette.bordeaux),
        ),
        const SizedBox(height: 10),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 18),
        child,
      ],
    );
  }
}

class _Shell extends StatelessWidget {
  const _Shell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1160),
        child: child,
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onTap});

  final String label;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(context),
      style: TextButton.styleFrom(
        foregroundColor: _SitePalette.footerText,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        overlayColor: _SitePalette.footerText.withValues(alpha: 0.08),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: _SitePalette.footerText,
        ),
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 7),
            decoration: const BoxDecoration(
              color: _SitePalette.brand,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
            ),
          ),
        ],
      ),
    );
  }
}

abstract final class _SitePalette {
  static const Color brand = Color(0xFFF9D932);
  static const Color surface = Color(0xFFFFF8F0);
  static const Color ink = Color(0xFF252015);
  static const Color mutedText = Color(0xFF6C624D);
  static const Color bordeaux = Color(0xFF5D1A1A);
  static const Color outline = Color(0xFFD3CEC4);
  static const Color outlineSoft = Color(0xFFE8E1D6);
  static const Color footerBackground = Color(0xFF474A48);
  static const Color footerText = Color(0xFFFFF8F0);
}
