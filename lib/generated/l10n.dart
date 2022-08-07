// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Batch`
  String get batchSidebar {
    return Intl.message(
      'Batch',
      name: 'batchSidebar',
      desc: '',
      args: [],
    );
  }

  /// `Browse`
  String get browseSidebar {
    return Intl.message(
      'Browse',
      name: 'browseSidebar',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get collectionSidebar {
    return Intl.message(
      'Collection',
      name: 'collectionSidebar',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get downloadsSidebar {
    return Intl.message(
      'Downloads',
      name: 'downloadsSidebar',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsSidebar {
    return Intl.message(
      'Settings',
      name: 'settingsSidebar',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get aboutSidebar {
    return Intl.message(
      'About',
      name: 'aboutSidebar',
      desc: '',
      args: [],
    );
  }

  /// `Batch Downloads`
  String get batchTitle {
    return Intl.message(
      'Batch Downloads',
      name: 'batchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Syllabus`
  String get syllabusTag {
    return Intl.message(
      'Syllabus',
      name: 'syllabusTag',
      desc: '',
      args: [],
    );
  }

  /// `Year range`
  String get yearRangeTag {
    return Intl.message(
      'Year range',
      name: 'yearRangeTag',
      desc: '',
      args: [],
    );
  }

  /// `Seasons`
  String get seasonsTag {
    return Intl.message(
      'Seasons',
      name: 'seasonsTag',
      desc: '',
      args: [],
    );
  }

  /// `Paper type`
  String get paperTypeTag {
    return Intl.message(
      'Paper type',
      name: 'paperTypeTag',
      desc: '',
      args: [],
    );
  }

  /// `Select subject`
  String get selectSubjectHint {
    return Intl.message(
      'Select subject',
      name: 'selectSubjectHint',
      desc: '',
      args: [],
    );
  }

  /// `Select season`
  String get selectSeasonHint {
    return Intl.message(
      'Select season',
      name: 'selectSeasonHint',
      desc: '',
      args: [],
    );
  }

  /// `Select paper numbers`
  String get selectPaperNumbersHint {
    return Intl.message(
      'Select paper numbers',
      name: 'selectPaperNumbersHint',
      desc: '',
      args: [],
    );
  }

  /// `Select paper types`
  String get selectPaperTypesHint {
    return Intl.message(
      'Select paper types',
      name: 'selectPaperTypesHint',
      desc: '',
      args: [],
    );
  }

  /// `Some fields are not filled in`
  String get fieldsNotFilledError {
    return Intl.message(
      'Some fields are not filled in',
      name: 'fieldsNotFilledError',
      desc: '',
      args: [],
    );
  }

  /// `Add to Collection`
  String get addToCollectionButton {
    return Intl.message(
      'Add to Collection',
      name: 'addToCollectionButton',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get downloadButton {
    return Intl.message(
      'Download',
      name: 'downloadButton',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get selectAllButton {
    return Intl.message(
      'Select all',
      name: 'selectAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Select none`
  String get selectNoneButton {
    return Intl.message(
      'Select none',
      name: 'selectNoneButton',
      desc: '',
      args: [],
    );
  }

  /// `Spring (February - March)`
  String get springItem {
    return Intl.message(
      'Spring (February - March)',
      name: 'springItem',
      desc: '',
      args: [],
    );
  }

  /// `Summer (May - June)`
  String get summerItem {
    return Intl.message(
      'Summer (May - June)',
      name: 'summerItem',
      desc: '',
      args: [],
    );
  }

  /// `Winter (October - November)`
  String get winterItem {
    return Intl.message(
      'Winter (October - November)',
      name: 'winterItem',
      desc: '',
      args: [],
    );
  }

  /// `Other Seasons`
  String get otherSeasonsItem {
    return Intl.message(
      'Other Seasons',
      name: 'otherSeasonsItem',
      desc: '',
      args: [],
    );
  }

  /// `Question Paper`
  String get questionPaperItem {
    return Intl.message(
      'Question Paper',
      name: 'questionPaperItem',
      desc: '',
      args: [],
    );
  }

  /// `Mark Scheme`
  String get markSchemeItem {
    return Intl.message(
      'Mark Scheme',
      name: 'markSchemeItem',
      desc: '',
      args: [],
    );
  }

  /// `Specimen Paper`
  String get specimenPaperItem {
    return Intl.message(
      'Specimen Paper',
      name: 'specimenPaperItem',
      desc: '',
      args: [],
    );
  }

  /// `Specimen Mark Scheme`
  String get specimenMarkSchemeItem {
    return Intl.message(
      'Specimen Mark Scheme',
      name: 'specimenMarkSchemeItem',
      desc: '',
      args: [],
    );
  }

  /// `Examiner Report`
  String get examinerReportItem {
    return Intl.message(
      'Examiner Report',
      name: 'examinerReportItem',
      desc: '',
      args: [],
    );
  }

  /// `Grade Thresholds`
  String get gradeThresholdsItem {
    return Intl.message(
      'Grade Thresholds',
      name: 'gradeThresholdsItem',
      desc: '',
      args: [],
    );
  }

  /// `Confidential Instructions`
  String get confidentialInstructionsItem {
    return Intl.message(
      'Confidential Instructions',
      name: 'confidentialInstructionsItem',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get otherPaperTypesItem {
    return Intl.message(
      'Others',
      name: 'otherPaperTypesItem',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 season selected}, other{{count} seasons selected}}`
  String seasonSelectedMessage(int count) {
    return Intl.message(
      '{count, plural, =1{1 season selected}, other{$count seasons selected}}',
      name: 'seasonSelectedMessage',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =1{1 paper number selected}, other{{count} paper numbers selected}}`
  String paperNumberMessage(int count) {
    return Intl.message(
      '{count, plural, =1{1 paper number selected}, other{$count paper numbers selected}}',
      name: 'paperNumberMessage',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =1{1 paper type selected}, other{{count} paper types selected}}`
  String paperTypeMessage(int count) {
    return Intl.message(
      '{count, plural, =1{1 paper type selected}, other{$count paper types selected}}',
      name: 'paperTypeMessage',
      desc: '',
      args: [count],
    );
  }

  /// `Subjects`
  String get subjectsTitle {
    return Intl.message(
      'Subjects',
      name: 'subjectsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Subject name`
  String get subjectNameHeading {
    return Intl.message(
      'Subject name',
      name: 'subjectNameHeading',
      desc: '',
      args: [],
    );
  }

  /// `Subject code`
  String get subjectCodeHeading {
    return Intl.message(
      'Subject code',
      name: 'subjectCodeHeading',
      desc: '',
      args: [],
    );
  }

  /// `Browse Papers`
  String get browseTitle {
    return Intl.message(
      'Browse Papers',
      name: 'browseTitle',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, other{{count} selected}}`
  String papersSelectedTag(int count) {
    return Intl.plural(
      count,
      other: '$count selected',
      name: 'papersSelectedTag',
      desc: '',
      args: [count],
    );
  }

  /// `View Selection`
  String get viewSelectionButton {
    return Intl.message(
      'View Selection',
      name: 'viewSelectionButton',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeLocation {
    return Intl.message(
      'Home',
      name: 'homeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Entry name`
  String get entryNameHeading {
    return Intl.message(
      'Entry name',
      name: 'entryNameHeading',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get typeHeading {
    return Intl.message(
      'Type',
      name: 'typeHeading',
      desc: '',
      args: [],
    );
  }

  /// `Folder`
  String get folderType {
    return Intl.message(
      'Folder',
      name: 'folderType',
      desc: '',
      args: [],
    );
  }

  /// `Mark scheme`
  String get msType {
    return Intl.message(
      'Mark scheme',
      name: 'msType',
      desc: '',
      args: [],
    );
  }

  /// `Question paper`
  String get qpType {
    return Intl.message(
      'Question paper',
      name: 'qpType',
      desc: '',
      args: [],
    );
  }

  /// `Examiner report`
  String get erType {
    return Intl.message(
      'Examiner report',
      name: 'erType',
      desc: '',
      args: [],
    );
  }

  /// `Grade thresholds`
  String get gtType {
    return Intl.message(
      'Grade thresholds',
      name: 'gtType',
      desc: '',
      args: [],
    );
  }

  /// `Confidential instructions`
  String get ciType {
    return Intl.message(
      'Confidential instructions',
      name: 'ciType',
      desc: '',
      args: [],
    );
  }

  /// `Insert`
  String get inType {
    return Intl.message(
      'Insert',
      name: 'inType',
      desc: '',
      args: [],
    );
  }

  /// `Source files`
  String get sfType {
    return Intl.message(
      'Source files',
      name: 'sfType',
      desc: '',
      args: [],
    );
  }

  /// `Specimen mark scheme`
  String get smType {
    return Intl.message(
      'Specimen mark scheme',
      name: 'smType',
      desc: '',
      args: [],
    );
  }

  /// `Specimen paper`
  String get spType {
    return Intl.message(
      'Specimen paper',
      name: 'spType',
      desc: '',
      args: [],
    );
  }

  /// `Transcript`
  String get qrType {
    return Intl.message(
      'Transcript',
      name: 'qrType',
      desc: '',
      args: [],
    );
  }

  /// `Speaking assessment`
  String get rpType {
    return Intl.message(
      'Speaking assessment',
      name: 'rpType',
      desc: '',
      args: [],
    );
  }

  /// `Examiner's notes`
  String get tnType {
    return Intl.message(
      'Examiner\'s notes',
      name: 'tnType',
      desc: '',
      args: [],
    );
  }

  /// `Syllabus`
  String get syType {
    return Intl.message(
      'Syllabus',
      name: 'syType',
      desc: '',
      args: [],
    );
  }

  /// `Specimen insert`
  String get siType {
    return Intl.message(
      'Specimen insert',
      name: 'siType',
      desc: '',
      args: [],
    );
  }

  /// `Syllabus update`
  String get suType {
    return Intl.message(
      'Syllabus update',
      name: 'suType',
      desc: '',
      args: [],
    );
  }

  /// `Other file`
  String get otherType {
    return Intl.message(
      'Other file',
      name: 'otherType',
      desc: '',
      args: [],
    );
  }

  /// `Selected papers`
  String get selectedPapersTitle {
    return Intl.message(
      'Selected papers',
      name: 'selectedPapersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove all`
  String get removeAllButton {
    return Intl.message(
      'Remove all',
      name: 'removeAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Download all`
  String get downloadAllButton {
    return Intl.message(
      'Download all',
      name: 'downloadAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Tap to remove any single item`
  String get tapToRemoveHint {
    return Intl.message(
      'Tap to remove any single item',
      name: 'tapToRemoveHint',
      desc: '',
      args: [],
    );
  }

  /// `Seems like you did not selected any papers yet`
  String get seemsNoSelection {
    return Intl.message(
      'Seems like you did not selected any papers yet',
      name: 'seemsNoSelection',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get collectionTitle {
    return Intl.message(
      'Collection',
      name: 'collectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Collected time`
  String get collectedTimeHeading {
    return Intl.message(
      'Collected time',
      name: 'collectedTimeHeading',
      desc: '',
      args: [],
    );
  }

  /// `Papers`
  String get papersHeading {
    return Intl.message(
      'Papers',
      name: 'papersHeading',
      desc: '',
      args: [],
    );
  }

  /// `Seems like you did not add anything to collection yet`
  String get seemsNoCollection {
    return Intl.message(
      'Seems like you did not add anything to collection yet',
      name: 'seemsNoCollection',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get downloadsTitle {
    return Intl.message(
      'Downloads',
      name: 'downloadsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel All`
  String get cancelAllButton {
    return Intl.message(
      'Cancel All',
      name: 'cancelAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Show Downloaded`
  String get showDownloadedButton {
    return Intl.message(
      'Show Downloaded',
      name: 'showDownloadedButton',
      desc: '',
      args: [],
    );
  }

  /// `Reveal Downloads Folder`
  String get revealDownloadsFolder {
    return Intl.message(
      'Reveal Downloads Folder',
      name: 'revealDownloadsFolder',
      desc: '',
      args: [],
    );
  }

  /// `Tap to cancel any download`
  String get tapToCancelHint {
    return Intl.message(
      'Tap to cancel any download',
      name: 'tapToCancelHint',
      desc: '',
      args: [],
    );
  }

  /// `File name`
  String get fileNameHeading {
    return Intl.message(
      'File name',
      name: 'fileNameHeading',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progressHeading {
    return Intl.message(
      'Progress',
      name: 'progressHeading',
      desc: '',
      args: [],
    );
  }

  /// `Seems like there's nothing to download`
  String get seemsNoDownload {
    return Intl.message(
      'Seems like there\'s nothing to download',
      name: 'seemsNoDownload',
      desc: '',
      args: [],
    );
  }

  /// `Download failed`
  String get downloadFailedProgress {
    return Intl.message(
      'Download failed',
      name: 'downloadFailedProgress',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get waitingProgress {
    return Intl.message(
      'Waiting',
      name: 'waitingProgress',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearanceTag {
    return Intl.message(
      'Appearance',
      name: 'appearanceTag',
      desc: '',
      args: [],
    );
  }

  /// `Download path`
  String get downloadPathTag {
    return Intl.message(
      'Download path',
      name: 'downloadPathTag',
      desc: '',
      args: [],
    );
  }

  /// `Simultaneous downloads`
  String get simultaneousDownloadsTag {
    return Intl.message(
      'Simultaneous downloads',
      name: 'simultaneousDownloadsTag',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageTag {
    return Intl.message(
      'Language',
      name: 'languageTag',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get autoButton {
    return Intl.message(
      'Auto',
      name: 'autoButton',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get lightButton {
    return Intl.message(
      'Light',
      name: 'lightButton',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get darkButton {
    return Intl.message(
      'Dark',
      name: 'darkButton',
      desc: '',
      args: [],
    );
  }

  /// `Select download path`
  String get selectDownloadPathButton {
    return Intl.message(
      'Select download path',
      name: 'selectDownloadPathButton',
      desc: '',
      args: [],
    );
  }

  /// `About Past Paper Finder`
  String get aboutTitle {
    return Intl.message(
      'About Past Paper Finder',
      name: 'aboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Development version`
  String get versionTag {
    return Intl.message(
      'Development version',
      name: 'versionTag',
      desc: '',
      args: [],
    );
  }

  /// `Last commit `
  String get commitTag {
    return Intl.message(
      'Last commit ',
      name: 'commitTag',
      desc: '',
      args: [],
    );
  }

  /// `Created by Micfong as a part of SCIE.DEV`
  String get createdByTag {
    return Intl.message(
      'Created by Micfong as a part of SCIE.DEV',
      name: 'createdByTag',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor me`
  String get sponsorTag {
    return Intl.message(
      'Sponsor me',
      name: 'sponsorTag',
      desc: '',
      args: [],
    );
  }

  /// `Download failed`
  String get downloadFailedTitle {
    return Intl.message(
      'Download failed',
      name: 'downloadFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Download path not specified. Please select a path in Settings page.`
  String get downloadFailedMessage {
    return Intl.message(
      'Download path not specified. Please select a path in Settings page.',
      name: 'downloadFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `PayPal`
  String get paypalButton {
    return Intl.message(
      'PayPal',
      name: 'paypalButton',
      desc: '',
      args: [],
    );
  }

  /// `WeChat Pay`
  String get wechatpayButton {
    return Intl.message(
      'WeChat Pay',
      name: 'wechatpayButton',
      desc: '',
      args: [],
    );
  }

  /// `Alipay`
  String get alipayButton {
    return Intl.message(
      'Alipay',
      name: 'alipayButton',
      desc: '',
      args: [],
    );
  }

  /// `If you wish to appear in the sponsors list, please send a email to micfong2@outlook.com with the amount donated, time of donation, your name (or nickname you want to show), and your avatar. Thank you for your donation!`
  String get sponsorNote {
    return Intl.message(
      'If you wish to appear in the sponsors list, please send a email to micfong2@outlook.com with the amount donated, time of donation, your name (or nickname you want to show), and your avatar. Thank you for your donation!',
      name: 'sponsorNote',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
