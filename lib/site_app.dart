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
                  currentRoute: '/privacy',
                  child: _LegalPage(
                    title: 'Privacy Policy / 隱私權政策',
                    subtitle:
                        'Yellow Grapes mobile application and related services',
                    subtitleZh: 'Yellow Grapes 行動應用程式與相關服務',
                    sections: privacySections,
                  ),
                );
              case '/terms':
                return const _SiteScaffold(
                  currentRoute: '/terms',
                  child: _LegalPage(
                    title: 'Terms of Service / 服務條款',
                    subtitle:
                        'Operating terms for Yellow Grapes and related services',
                    subtitleZh: 'Yellow Grapes 與相關服務之使用條款',
                    sections: termsSections,
                  ),
                );
              case '/':
              default:
                return const _SiteScaffold(
                  currentRoute: '/',
                  child: _HomePage(),
                );
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
          borderRadius: BorderRadius.circular(28),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
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
  const _SiteScaffold({required this.currentRoute, required this.child});

  final String currentRoute;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              _SitePalette.surface,
              Color(0xFFFFFCF3),
              _SitePalette.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _SiteHeader(currentRoute: currentRoute),
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
  const _SiteHeader({required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 860;
    final Widget brand = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            'assets/images/yellow_grapes_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: _SitePalette.bordeaux,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Taiwan wine map',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: _SitePalette.mutedText),
            ),
          ],
        ),
      ],
    );

    final Widget nav = Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        _NavButton(label: 'Home', routeName: '/', currentRoute: currentRoute),
        _NavButton(
          label: 'Privacy',
          routeName: '/privacy',
          currentRoute: currentRoute,
        ),
        _NavButton(
          label: 'Terms',
          routeName: '/terms',
          currentRoute: currentRoute,
        ),
        ElevatedButton(
          onPressed: () => openExternalLink(supportMailtoUrl),
          child: const Text('Contact / Learn More'),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
      decoration: const BoxDecoration(
        color: Color(0xCCFAF8F6),
        border: Border(bottom: BorderSide(color: _SitePalette.outlineSoft)),
      ),
      child: _Shell(
        child: compact
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[brand, const SizedBox(height: 16), nav],
              )
            : Row(
                children: <Widget>[
                  Expanded(child: brand),
                  nav,
                ],
              ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.routeName,
    required this.currentRoute,
  });

  final String label;
  final String routeName;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentRoute == routeName;
    return TextButton(
      onPressed: isActive
          ? null
          : () => Navigator.of(context).pushReplacementNamed(routeName),
      style: TextButton.styleFrom(
        foregroundColor: isActive ? _SitePalette.bordeaux : _SitePalette.ink,
        backgroundColor: isActive
            ? const Color(0xFFFFF6CC)
            : Colors.transparent,
        disabledForegroundColor: _SitePalette.bordeaux,
        disabledBackgroundColor: const Color(0xFFFFF6CC),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isActive ? _SitePalette.brand : _SitePalette.outlineSoft,
          ),
        ),
      ),
      child: Text(label),
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
              titleZh: '以探索為導向整理葡萄酒相關商家',
              child: const _MerchantCategoryGrid(),
            ),
            const SizedBox(height: 28),
            _Section(
              eyebrow: 'Core Features',
              title:
                  'Built to help people discover, compare, and stay informed',
              titleZh: '協助使用者探索、比較並掌握最新資訊',
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

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 920;

    final Widget intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5C0),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'Taiwan-focused wine discovery platform',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: _SitePalette.bordeaux),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          appName,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: compact ? 42 : 58),
        ),
        const SizedBox(height: 12),
        Text(
          appTagline,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: _SitePalette.ink),
        ),
        const SizedBox(height: 18),
        Text(
          'Yellow Grapes is a wine map app for Taiwan, built to help people discover wine bars, restaurants, BYO spots, bottle shops, hypermarkets, wineries, storage services, and wine education in one place.',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: _SitePalette.ink),
        ),
        const SizedBox(height: 10),
        Text(
          'Yellow Grapes 是一款以台灣為核心的葡萄酒地圖應用程式，協助使用者在同一個平台探索酒吧、餐廳、自帶酒餐廳、酒商、量販、酒莊、儲酒服務與葡萄酒教育資源。',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            color: _SitePalette.mutedText,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => openExternalLink(supportMailtoUrl),
              child: const Text('Contact / Learn More'),
            ),
            OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/privacy'),
              child: const Text('View Privacy Policy'),
            ),
          ],
        ),
      ],
    );

    final Widget spotlight = Card(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
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
            Row(
              children: <Widget>[
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF5C0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/images/yellow_grapes_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Main coverage / 主要收錄範圍',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: _SitePalette.bordeaux,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: merchantCategories
                  .map(
                    (MerchantCategory category) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: category.color.withValues(alpha: 0.42),
                        ),
                      ),
                      child: Text(
                        '${category.englishName} / ${category.chineseName}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: _SitePalette.ink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Divider(color: _SitePalette.outlineSoft),
            const SizedBox(height: 18),
            Text(
              'Review-ready website essentials',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: _SitePalette.ink),
            ),
            const SizedBox(height: 12),
            const _BulletLine(
              text:
                  'Clear public description, privacy policy, and terms of service.',
            ),
            const _BulletLine(
              text:
                  'Company attribution for Torsade Technology Limited Company.',
            ),
            const _BulletLine(
              text: 'Public contact path through contact@yellowgrapes.app.',
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
          borderRadius: BorderRadius.circular(32),
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
        child: compact
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  intro,
                  const SizedBox(height: 24),
                  spotlight,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(flex: 6, child: intro),
                  const SizedBox(width: 24),
                  Expanded(flex: 5, child: spotlight),
                ],
              ),
      ),
    );
  }
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
        childAspectRatio: crossAxisCount == 1 ? 1.55 : 1.14,
      ),
      itemBuilder: (BuildContext context, int index) {
        final MerchantCategory category = merchantCategories[index];
        return Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(category.icon, color: _SitePalette.ink),
                ),
                const SizedBox(height: 16),
                Text(
                  category.englishName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  category.chineseName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _SitePalette.bordeaux,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  category.englishDescription,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
                ),
                const SizedBox(height: 8),
                Text(
                  category.chineseDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
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
          borderRadius: BorderRadius.circular(24),
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
                borderRadius: BorderRadius.circular(14),
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
            const SizedBox(height: 8),
            Text(
              highlight.chineseDescription,
              style: Theme.of(context).textTheme.bodyMedium,
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
        borderRadius: BorderRadius.circular(28),
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
          const SizedBox(height: 10),
          Text(
            'Yellow Grapes 僅為資訊平台，並不直接販售酒類。使用者應符合台灣法定飲酒年齡（18 歲）後，方可接觸酒類相關內容。請理性飲酒。',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              color: _SitePalette.mutedText,
            ),
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
    required this.subtitleZh,
    required this.sections,
  });

  final String title;
  final String subtitle;
  final String subtitleZh;
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
                  borderRadius: BorderRadius.circular(28),
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
                    const SizedBox(height: 8),
                    Text(
                      subtitleZh,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        color: _SitePalette.mutedText,
                      ),
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
                    const SizedBox(height: 12),
                    Text(
                      '生效日期：$effectiveDateChinese',
                      style: Theme.of(context).textTheme.bodyMedium,
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
          borderRadius: BorderRadius.circular(24),
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
            const SizedBox(height: 18),
            const Divider(color: _SitePalette.outlineSoft),
            const SizedBox(height: 18),
            Text(
              section.chineseTitle,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: _SitePalette.ink),
            ),
            const SizedBox(height: 10),
            Text(
              section.chineseBody,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                color: _SitePalette.mutedText,
              ),
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
        borderRadius: BorderRadius.circular(18),
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
    required this.titleZh,
    required this.child,
  });

  final String eyebrow;
  final String title;
  final String titleZh;
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
        const SizedBox(height: 8),
        Text(
          titleZh,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            color: _SitePalette.mutedText,
          ),
        ),
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

class _SiteFooter extends StatelessWidget {
  const _SiteFooter();

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 860;

    final Widget footerText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          appName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: _SitePalette.bordeaux,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Taiwan-focused wine map and business directory.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 6),
        Text(
          companyCopyright,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: _SitePalette.ink),
        ),
      ],
    );

    final Widget footerLinks = Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.end,
      children: <Widget>[
        _FooterLink(
          label: 'Home',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/'),
        ),
        _FooterLink(
          label: 'Privacy',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/privacy'),
        ),
        _FooterLink(
          label: 'Terms',
          onTap: (BuildContext context) =>
              Navigator.of(context).pushReplacementNamed('/terms'),
        ),
        _FooterLink(
          label: 'contact@yellowgrapes.app',
          onTap: (_) => openExternalLink(supportMailtoUrl),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 26),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F1E7),
        border: Border(top: BorderSide(color: _SitePalette.outlineSoft)),
      ),
      child: _Shell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            compact
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      footerText,
                      const SizedBox(height: 16),
                      footerLinks,
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Expanded(child: footerText),
                      footerLinks,
                    ],
                  ),
            const SizedBox(height: 16),
            Text(
              'Yellow Grapes is an information platform only and does not facilitate alcohol sales. Please drink responsibly.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
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
        foregroundColor: _SitePalette.ink,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: _SitePalette.outlineSoft),
        ),
      ),
      child: Text(label),
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
  static const Color surface = Color(0xFFFAF8F6);
  static const Color ink = Color(0xFF252015);
  static const Color mutedText = Color(0xFF6C624D);
  static const Color bordeaux = Color(0xFF5D1A1A);
  static const Color outline = Color(0xFFD3CEC4);
  static const Color outlineSoft = Color(0xFFE8E1D6);
}
