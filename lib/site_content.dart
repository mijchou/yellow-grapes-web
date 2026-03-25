import 'package:flutter/material.dart';

const String appName = 'Yellow Grapes';
const String appTagline = 'Your business directory to wine.';
const String supportEmail = 'contact@yellowgrapes.app';
const String supportMailtoUrl = 'mailto:contact@yellowgrapes.app';
const String companyName = 'Torsade Technology Limited Company';
const String companyCopyright =
    '© 2026 Torsade Technology Limited Company. All rights reserved.';
const String effectiveDateEnglish = 'March 26, 2026';
const String effectiveDateChinese = '2026 年 3 月 26 日';

class MerchantCategory {
  const MerchantCategory({
    required this.englishName,
    required this.chineseName,
    required this.icon,
    required this.color,
    required this.englishDescription,
    required this.chineseDescription,
  });

  final String englishName;
  final String chineseName;
  final IconData icon;
  final Color color;
  final String englishDescription;
  final String chineseDescription;
}

class FeatureHighlight {
  const FeatureHighlight({
    required this.eyebrow,
    required this.title,
    required this.englishDescription,
    required this.chineseDescription,
    required this.icon,
  });

  final String eyebrow;
  final String title;
  final String englishDescription;
  final String chineseDescription;
  final IconData icon;
}

class LegalSection {
  const LegalSection({
    required this.title,
    required this.englishBody,
    required this.chineseTitle,
    required this.chineseBody,
  });

  final String title;
  final String englishBody;
  final String chineseTitle;
  final String chineseBody;
}

const List<MerchantCategory> merchantCategories = <MerchantCategory>[
  MerchantCategory(
    englishName: 'Wine Bars',
    chineseName: '酒吧',
    icon: Icons.wine_bar,
    color: Color(0xFFECC5A1),
    englishDescription:
        'Find by-the-glass pours, tasting nights, and destination wine bars.',
    chineseDescription: '探索單杯供應、品酒活動與值得專程前往的葡萄酒吧。',
  ),
  MerchantCategory(
    englishName: 'Restaurants',
    chineseName: '餐廳',
    icon: Icons.restaurant,
    color: Color(0xFFA99D91),
    englishDescription:
        'Browse restaurants where wine is part of the dining experience.',
    chineseDescription: '瀏覽把葡萄酒體驗納入餐飲場景的餐廳。',
  ),
  MerchantCategory(
    englishName: 'BYO Restaurants',
    chineseName: '自帶酒餐廳',
    icon: Icons.dining,
    color: Color(0xFFF1F3EB),
    englishDescription:
        'Locate bring-your-own-bottle dining spots and corkage-friendly venues.',
    chineseDescription: '尋找可自帶酒用餐與對洗杯費友善的場域。',
  ),
  MerchantCategory(
    englishName: 'Bottle Shops',
    chineseName: '酒商',
    icon: Icons.liquor,
    color: Color(0xFFA6BEDE),
    englishDescription:
        'Compare retailers, importers, and specialty shops across Taiwan.',
    chineseDescription: '比較全台各地零售商、進口商與專門酒商。',
  ),
  MerchantCategory(
    englishName: 'Hypermarkets',
    chineseName: '超市/量販',
    icon: Icons.shopping_cart,
    color: Color(0xFF98A4A3),
    englishDescription:
        'See larger-format stores with accessible everyday wine selections.',
    chineseDescription: '查看大型量販與超市中較易入手的葡萄酒選擇。',
  ),
  MerchantCategory(
    englishName: 'Wineries',
    chineseName: '酒莊',
    icon: Icons.agriculture,
    color: Color(0xFFE3C98E),
    englishDescription:
        'Highlight wineries, vineyards, and regional wine destinations.',
    chineseDescription: '收錄酒莊、葡萄園與可造訪的產區目的地。',
  ),
  MerchantCategory(
    englishName: 'Wine Storage',
    chineseName: '酒窖',
    icon: Icons.inventory_2,
    color: Color(0xFF5B738D),
    englishDescription:
        'Surface storage and cellar services relevant to wine collectors.',
    chineseDescription: '提供適合藏家參考的儲酒與酒窖相關服務。',
  ),
  MerchantCategory(
    englishName: 'Wine Education',
    chineseName: '教育',
    icon: Icons.school,
    color: Color(0xFFC9684C),
    englishDescription:
        'Discover schools, classes, tasting workshops, and learning resources.',
    chineseDescription: '探索課程、品酒工作坊與葡萄酒教育資源。',
  ),
];

const List<FeatureHighlight> featureHighlights = <FeatureHighlight>[
  FeatureHighlight(
    eyebrow: 'Map Discovery',
    title: 'A wine map built for Taiwan',
    englishDescription:
        'Yellow Grapes helps people discover wine-related businesses through a location-first browsing experience.',
    chineseDescription: 'Yellow Grapes 以地圖為核心，協助使用者探索台灣各地的葡萄酒相關商家。',
    icon: Icons.map_outlined,
  ),
  FeatureHighlight(
    eyebrow: 'Search & Filters',
    title: 'Useful context beyond a pin on a map',
    englishDescription:
        'Search by merchant name and narrow results with category, open-now, wine-list, and other practical filters.',
    chineseDescription: '除了地圖點位，使用者也能依商家名稱、分類、是否營業中與是否有酒單等條件篩選。',
    icon: Icons.tune,
  ),
  FeatureHighlight(
    eyebrow: 'Community & Business',
    title: 'Listings that can keep improving',
    englishDescription:
        'Users can suggest edits and business owners can claim listings to keep information useful and current.',
    chineseDescription: '使用者可提交修正建議，商家也可申請認領，以維持資訊的可用性與時效性。',
    icon: Icons.groups_outlined,
  ),
];

const List<LegalSection> privacySections = <LegalSection>[
  LegalSection(
    title: '1. Scope and Operator',
    englishBody:
        'This Privacy Policy applies to the Yellow Grapes mobile application and related services operated by Torsade Technology Limited Company. It explains how we collect, use, store, protect, and share personal data when users browse merchant information, create accounts, save places, submit edits, claim businesses, or contact us.',
    chineseTitle: '1. 適用範圍與營運者',
    chineseBody:
        '本隱私權政策適用於 Torsade Technology Limited Company 所營運之 Yellow Grapes 行動應用程式及相關服務，說明我們在使用者瀏覽商家資訊、建立帳戶、收藏地點、提交建議、認領商家或聯絡我們時，如何蒐集、利用、保存、保護與分享個人資料。',
  ),
  LegalSection(
    title: '2. Data We Collect',
    englishBody:
        'Depending on how the service is used, we may collect account details, sign-in identifiers, profile information, saved merchants, legal-consent records, submitted edits and reports, merchant-claim materials, device diagnostics, app analytics, and location data used for nearby discovery and map centering when permission is granted.',
    chineseTitle: '2. 我們蒐集的資料',
    chineseBody:
        '依使用方式不同，我們可能蒐集帳戶資料、登入識別資訊、個人檔案內容、收藏紀錄、法律同意紀錄、編輯建議與檢舉內容、商家認領資料、裝置診斷資訊、應用程式分析資料，以及在獲得授權時用於附近商家探索與地圖置中的位置資料。',
  ),
  LegalSection(
    title: '3. Purposes of Use',
    englishBody:
        'We use personal data to provide map, search, favorites, personalization, customer support, merchant management, service security, debugging, analytics, notifications, and legal-compliance functions. We do not collect data for the purpose of directly selling alcohol through the site or app.',
    chineseTitle: '3. 資料利用目的',
    chineseBody:
        '我們利用個人資料提供地圖、搜尋、收藏、個人化、客服、商家管理、服務安全、除錯、分析、通知與法令遵循等功能。我們蒐集資料的目的並非透過網站或 App 直接販售酒類。',
  ),
  LegalSection(
    title: '4. Sharing and Service Providers',
    englishBody:
        'We may share data with vendors that help us operate the service, including cloud infrastructure, authentication, maps, analytics, notifications, storage, and customer-support tools. These service providers may include Firebase or Google Cloud, Mapbox, sign-in providers, and other vendors engaged under appropriate contractual and security controls.',
    chineseTitle: '4. 資料分享與服務供應商',
    chineseBody:
        '我們可能與協助提供服務的供應商分享資料，包括雲端基礎設施、身分驗證、地圖、分析、通知、儲存與客服工具。此類供應商可能包含 Firebase 或 Google Cloud、Mapbox、登入服務提供者，以及在合約與安全控管下合作的其他第三方。',
  ),
  LegalSection(
    title: '5. Retention, Security, and User Rights',
    englishBody:
        'We retain data only for as long as needed for the stated purposes, legal obligations, dispute resolution, and service integrity. We apply reasonable administrative and technical safeguards, but no system can guarantee absolute security. Users may contact us to request access, correction, deletion, or other rights available under applicable law, including Taiwan\'s Personal Data Protection Act.',
    chineseTitle: '5. 保存期限、安全措施與使用者權利',
    chineseBody:
        '我們僅在達成前述目的、履行法律義務、處理爭議與維護服務完整性所必要的期間內保存資料，並採取合理的管理與技術保護措施，但任何系統均無法保證絕對安全。使用者可依適用法令，包括台灣《個人資料保護法》，聯絡我們行使查詢、更正、刪除或其他法定權利。',
  ),
  LegalSection(
    title: '6. Minors, Policy Updates, and Contact',
    englishBody:
        'Yellow Grapes focuses on alcohol-related merchant information. We do not intend for users under the legal drinking age in Taiwan to register for alcohol-related interactions. We may revise this policy from time to time and will publish updates on this site. Privacy questions can be sent to contact@yellowgrapes.app.',
    chineseTitle: '6. 未成年人、政策更新與聯絡方式',
    chineseBody:
        'Yellow Grapes 聚焦於酒類相關商家資訊，我們不預期台灣法定飲酒年齡以下之使用者註冊並參與酒類相關互動。我們可能不時修訂本政策，並於本網站公告更新。若有隱私相關問題，請來信 contact@yellowgrapes.app。',
  ),
];

const List<LegalSection> termsSections = <LegalSection>[
  LegalSection(
    title: '1. Acceptance and Service Scope',
    englishBody:
        'These Terms of Service govern use of the Yellow Grapes mobile application and related services operated by Torsade Technology Limited Company. By accessing or using Yellow Grapes, users agree to these terms and the Privacy Policy published on this site.',
    chineseTitle: '1. 接受條款與服務範圍',
    chineseBody:
        '本服務條款適用於 Torsade Technology Limited Company 所營運之 Yellow Grapes 行動應用程式及相關服務。凡存取或使用 Yellow Grapes，即表示使用者同意受本條款及本網站公布之隱私權政策拘束。',
  ),
  LegalSection(
    title: '2. Nature of the Service',
    englishBody:
        'Yellow Grapes is an information and discovery platform for wine-related businesses, wine lists, and wine education. Unless we expressly state otherwise in writing, Yellow Grapes is not the seller, retailer, importer, restaurant operator, logistics provider, or payment collection agent for alcohol, food, events, or merchant services displayed through the service.',
    chineseTitle: '2. 服務性質',
    chineseBody:
        'Yellow Grapes 是提供葡萄酒相關商家、酒單與葡萄酒教育資訊的探索平台。除非我們另以書面明示，Yellow Grapes 本身並非酒類賣方、零售商、進口商、餐飲經營者、物流商或代收付款機構。',
  ),
  LegalSection(
    title: '3. Eligibility and Age',
    englishBody:
        'Because Yellow Grapes includes alcohol-related content, users must be of legal drinking age in Taiwan, or otherwise use the service only as permitted by applicable law and with any required guardian consent. Users are responsible for providing accurate and current account information.',
    chineseTitle: '3. 使用資格與年齡限制',
    chineseBody:
        '由於 Yellow Grapes 含有酒類相關內容，使用者應符合台灣法定飲酒年齡，或在適用法令允許並取得必要監護人同意的情況下使用本服務。使用者應提供真實且最新的帳戶資訊。',
  ),
  LegalSection(
    title: '4. Accounts, Suggestions, and Merchant Claims',
    englishBody:
        'Some functions, including favorites, edit suggestions, reports, and merchant claims, require an account. Users remain responsible for the accuracy and legality of information they submit. Merchant owners or authorized representatives who claim a listing must have authority to act for that business and may be asked to provide verification materials.',
    chineseTitle: '4. 帳戶、建議編輯與商家認領',
    chineseBody:
        '部分功能包含收藏、建議編輯、檢舉與商家認領，需要先建立帳戶。使用者對其提交資料之正確性與合法性負責。申請認領商家的經營者或授權代表，必須具有代表該商家的權限，且可能需要提供驗證資料。',
  ),
  LegalSection(
    title: '5. Prohibited Conduct',
    englishBody:
        'Users may not impersonate others, submit false materials, scrape or reverse engineer the service, upload harmful code, infringe intellectual-property rights, misuse personal data, or use Yellow Grapes to facilitate unlawful alcohol sales or access by minors. We may restrict or terminate access when these terms are violated.',
    chineseTitle: '5. 禁止行為',
    chineseBody:
        '使用者不得冒用他人、提交不實資料、抓取或逆向工程本服務、上傳惡意程式、侵害智慧財產權、濫用個人資料，或利用 Yellow Grapes 協助未成年人接觸酒類或進行違法酒類交易。若違反本條款，我們得限制或終止使用權限。',
  ),
  LegalSection(
    title: '6. Content Accuracy, Disclaimers, and Liability',
    englishBody:
        'Merchant listings, wine lists, prices, opening hours, events, and other details may change at any time. Yellow Grapes is provided on an as-is and as-available basis, and users are responsible for their own decisions when visiting merchants, attending events, making purchases from third parties, or consuming alcohol. Please drink responsibly and never drink and drive.',
    chineseTitle: '6. 內容正確性、免責聲明與責任限制',
    chineseBody:
        '商家資訊、酒單、價格、營業時間、活動與其他內容可能隨時變動。Yellow Grapes 係以現況及可得性提供，使用者在造訪商家、參與活動、向第三方消費或飲酒時，應自行判斷並自負責任。請理性飲酒，酒後勿開車。',
  ),
  LegalSection(
    title: '7. Updates and Contact',
    englishBody:
        'We may update these terms as the service evolves. Continued use after an update means the revised terms apply to the maximum extent permitted by law. Questions about these terms may be sent to contact@yellowgrapes.app.',
    chineseTitle: '7. 條款更新與聯絡方式',
    chineseBody:
        '本服務條款可能因服務調整而更新。於法律允許範圍內，更新後繼續使用本服務，即表示適用修訂後條款。若對本條款有疑問，請來信 contact@yellowgrapes.app。',
  ),
];
