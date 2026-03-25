import 'package:flutter/material.dart';

const String appName = 'Yellow Grapes';
const String appTagline = 'The Yellow Pages of wine';
const String supportEmail = 'contact@yellowgrapes.app';
const String supportMailtoUrl = 'mailto:contact@yellowgrapes.app';
const String companyName = 'Torsade Technology Limited Company';
const String companyCopyright =
    '© 2026 Torsade Technology Limited Company. All rights reserved.';
const String effectiveDateEnglish = 'March 26, 2026';

class MerchantCategory {
  const MerchantCategory({
    required this.englishName,
    required this.icon,
    required this.color,
    required this.englishDescription,
  });

  final String englishName;
  final IconData icon;
  final Color color;
  final String englishDescription;
}

class FeatureHighlight {
  const FeatureHighlight({
    required this.eyebrow,
    required this.title,
    required this.englishDescription,
    required this.icon,
  });

  final String eyebrow;
  final String title;
  final String englishDescription;
  final IconData icon;
}

class LegalSection {
  const LegalSection({required this.title, required this.englishBody});

  final String title;
  final String englishBody;
}

const List<MerchantCategory> merchantCategories = <MerchantCategory>[
  MerchantCategory(
    englishName: 'Wine Bars',
    icon: Icons.wine_bar,
    color: Color(0xFFECC5A1),
    englishDescription:
        'Find by-the-glass pours, tasting nights, and destination wine bars.',
  ),
  MerchantCategory(
    englishName: 'Restaurants',
    icon: Icons.restaurant,
    color: Color(0xFFA99D91),
    englishDescription:
        'Browse restaurants where wine is part of the dining experience.',
  ),
  MerchantCategory(
    englishName: 'BYO Restaurants',
    icon: Icons.dining,
    color: Color(0xFFF1F3EB),
    englishDescription:
        'Locate bring-your-own-bottle dining spots and corkage-friendly venues.',
  ),
  MerchantCategory(
    englishName: 'Bottle Shops',
    icon: Icons.liquor,
    color: Color(0xFFA6BEDE),
    englishDescription:
        'Compare retailers, importers, and specialty shops across Taiwan.',
  ),
  MerchantCategory(
    englishName: 'Hypermarkets',
    icon: Icons.shopping_cart,
    color: Color(0xFF98A4A3),
    englishDescription:
        'See larger-format stores with accessible everyday wine selections.',
  ),
  MerchantCategory(
    englishName: 'Wineries',
    icon: Icons.agriculture,
    color: Color(0xFFE3C98E),
    englishDescription:
        'Highlight wineries, vineyards, and regional wine destinations.',
  ),
  MerchantCategory(
    englishName: 'Wine Storage',
    icon: Icons.inventory_2,
    color: Color(0xFF5B738D),
    englishDescription:
        'Surface storage and cellar services relevant to wine collectors.',
  ),
  MerchantCategory(
    englishName: 'Wine Education',
    icon: Icons.school,
    color: Color(0xFFC9684C),
    englishDescription:
        'Discover schools, classes, tasting workshops, and learning resources.',
  ),
];

const List<FeatureHighlight> featureHighlights = <FeatureHighlight>[
  FeatureHighlight(
    eyebrow: 'Map Discovery',
    title: 'A wine map built for Taiwan',
    englishDescription:
        'Yellow Grapes helps people discover wine-related businesses through a location-first browsing experience.',
    icon: Icons.map_outlined,
  ),
  FeatureHighlight(
    eyebrow: 'Search & Filters',
    title: 'Useful context beyond a pin on a map',
    englishDescription:
        'Search by merchant name and narrow results with category, open-now, wine-list, and other practical filters.',
    icon: Icons.tune,
  ),
  FeatureHighlight(
    eyebrow: 'Community & Business',
    title: 'Listings that can keep improving',
    englishDescription:
        'Users can suggest edits and business owners can claim listings to keep information useful and current.',
    icon: Icons.groups_outlined,
  ),
];

const List<LegalSection> privacySections = <LegalSection>[
  LegalSection(
    title: '1. Scope and Operator',
    englishBody:
        'This Privacy Policy applies to the Yellow Grapes mobile application and related services operated by Torsade Technology Limited Company. It explains how we collect, use, store, protect, and share personal data when users browse merchant information, create accounts, save places, submit edits, claim businesses, or contact us.',
  ),
  LegalSection(
    title: '2. Data We Collect',
    englishBody:
        'Depending on how the service is used, we may collect account details, sign-in identifiers, profile information, saved merchants, legal-consent records, submitted edits and reports, merchant-claim materials, device diagnostics, app analytics, and location data used for nearby discovery and map centering when permission is granted.',
  ),
  LegalSection(
    title: '3. Purposes of Use',
    englishBody:
        'We use personal data to provide map, search, favorites, personalization, customer support, merchant management, service security, debugging, analytics, notifications, and legal-compliance functions. We do not collect data for the purpose of directly selling alcohol through the site or app.',
  ),
  LegalSection(
    title: '4. Sharing and Service Providers',
    englishBody:
        'We may share data with vendors that help us operate the service, including cloud infrastructure, authentication, maps, analytics, notifications, storage, and customer-support tools. These service providers may include Firebase or Google Cloud, Mapbox, sign-in providers, and other vendors engaged under appropriate contractual and security controls.',
  ),
  LegalSection(
    title: '5. Retention, Security, and User Rights',
    englishBody:
        'We retain data only for as long as needed for the stated purposes, legal obligations, dispute resolution, and service integrity. We apply reasonable administrative and technical safeguards, but no system can guarantee absolute security. Users may contact us to request access, correction, deletion, or other rights available under applicable law, including Taiwan\'s Personal Data Protection Act.',
  ),
  LegalSection(
    title: '6. Minors, Policy Updates, and Contact',
    englishBody:
        'Yellow Grapes focuses on alcohol-related merchant information. We do not intend for users under the legal drinking age in Taiwan to register for alcohol-related interactions. We may revise this policy from time to time and will publish updates on this site. Privacy questions can be sent to contact@yellowgrapes.app.',
  ),
];

const List<LegalSection> termsSections = <LegalSection>[
  LegalSection(
    title: '1. Acceptance and Service Scope',
    englishBody:
        'These Terms of Service govern use of the Yellow Grapes mobile application and related services operated by Torsade Technology Limited Company. By accessing or using Yellow Grapes, users agree to these terms and the Privacy Policy published on this site.',
  ),
  LegalSection(
    title: '2. Nature of the Service',
    englishBody:
        'Yellow Grapes is an information and discovery platform for wine-related businesses, wine lists, and wine education. Unless we expressly state otherwise in writing, Yellow Grapes is not the seller, retailer, importer, restaurant operator, logistics provider, or payment collection agent for alcohol, food, events, or merchant services displayed through the service.',
  ),
  LegalSection(
    title: '3. Eligibility and Age',
    englishBody:
        'Because Yellow Grapes includes alcohol-related content, users must be of legal drinking age in Taiwan, or otherwise use the service only as permitted by applicable law and with any required guardian consent. Users are responsible for providing accurate and current account information.',
  ),
  LegalSection(
    title: '4. Accounts, Suggestions, and Merchant Claims',
    englishBody:
        'Some functions, including favorites, edit suggestions, reports, and merchant claims, require an account. Users remain responsible for the accuracy and legality of information they submit. Merchant owners or authorized representatives who claim a listing must have authority to act for that business and may be asked to provide verification materials.',
  ),
  LegalSection(
    title: '5. Prohibited Conduct',
    englishBody:
        'Users may not impersonate others, submit false materials, scrape or reverse engineer the service, upload harmful code, infringe intellectual-property rights, misuse personal data, or use Yellow Grapes to facilitate unlawful alcohol sales or access by minors. We may restrict or terminate access when these terms are violated.',
  ),
  LegalSection(
    title: '6. Content Accuracy, Disclaimers, and Liability',
    englishBody:
        'Merchant listings, wine lists, prices, opening hours, events, and other details may change at any time. Yellow Grapes is provided on an as-is and as-available basis, and users are responsible for their own decisions when visiting merchants, attending events, making purchases from third parties, or consuming alcohol. Please drink responsibly and never drink and drive.',
  ),
  LegalSection(
    title: '7. Updates and Contact',
    englishBody:
        'We may update these terms as the service evolves. Continued use after an update means the revised terms apply to the maximum extent permitted by law. Questions about these terms may be sent to contact@yellowgrapes.app.',
  ),
];
