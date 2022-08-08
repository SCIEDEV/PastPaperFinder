// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "{count, plural, =1{1 paper number selected}, other{${count} paper numbers selected}}";

  static String m1(count) =>
      "{count, plural, =1{1 paper type selected}, other{${count} paper types selected}}";

  static String m2(count) =>
      "${Intl.plural(count, other: '${count} selected')}";

  static String m3(count) =>
      "{count, plural, =1{1 season selected}, other{${count} seasons selected}}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutSidebar": MessageLookupByLibrary.simpleMessage("About"),
        "aboutTestingContent": MessageLookupByLibrary.simpleMessage(
            "This stage is under heavy development, so expect breaking changes and unstable behaviors."),
        "aboutTestingTag":
            MessageLookupByLibrary.simpleMessage("About testing"),
        "aboutTitle":
            MessageLookupByLibrary.simpleMessage("About Past Paper Finder"),
        "addToCollectionButton":
            MessageLookupByLibrary.simpleMessage("Add to Collection"),
        "alipayButton": MessageLookupByLibrary.simpleMessage("Alipay"),
        "appearanceTag": MessageLookupByLibrary.simpleMessage("Appearance"),
        "autoButton": MessageLookupByLibrary.simpleMessage("Auto"),
        "batchSidebar": MessageLookupByLibrary.simpleMessage("Batch"),
        "batchTitle": MessageLookupByLibrary.simpleMessage("Batch Downloads"),
        "browseSidebar": MessageLookupByLibrary.simpleMessage("Browse"),
        "browseTitle": MessageLookupByLibrary.simpleMessage("Browse Papers"),
        "bugAndFeatureContent1": MessageLookupByLibrary.simpleMessage(
            "Alpha versions are designed to be updating frequently, so please report as many bugs (or request as many features) as possible!"),
        "bugAndFeatureContent2": MessageLookupByLibrary.simpleMessage(
            "Feel free to report them to Micfong by WeChat directly (recommended), or by email at micfong2@outlook.com."),
        "bugAndFeatureTag": MessageLookupByLibrary.simpleMessage(
            "Bug reports & Feature requests"),
        "cancelAllButton": MessageLookupByLibrary.simpleMessage("Cancel All"),
        "ciType":
            MessageLookupByLibrary.simpleMessage("Confidential instructions"),
        "collectedTimeHeading":
            MessageLookupByLibrary.simpleMessage("Collected time"),
        "collectionSidebar": MessageLookupByLibrary.simpleMessage("Collection"),
        "collectionTitle": MessageLookupByLibrary.simpleMessage("Collection"),
        "commitTag": MessageLookupByLibrary.simpleMessage("Last commit "),
        "confidentialInstructionsItem":
            MessageLookupByLibrary.simpleMessage("Confidential Instructions"),
        "createdByTag": MessageLookupByLibrary.simpleMessage(
            "Created by Micfong as a part of SCIE.DEV"),
        "darkButton": MessageLookupByLibrary.simpleMessage("Dark"),
        "downloadAllButton":
            MessageLookupByLibrary.simpleMessage("Download all"),
        "downloadButton": MessageLookupByLibrary.simpleMessage("Download"),
        "downloadFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Download path not specified. Please select a path in Settings page."),
        "downloadFailedProgress":
            MessageLookupByLibrary.simpleMessage("Download failed"),
        "downloadFailedTitle":
            MessageLookupByLibrary.simpleMessage("Download failed"),
        "downloadPathTag":
            MessageLookupByLibrary.simpleMessage("Download path"),
        "downloadsSidebar": MessageLookupByLibrary.simpleMessage("Downloads"),
        "downloadsTitle": MessageLookupByLibrary.simpleMessage("Downloads"),
        "entryNameHeading": MessageLookupByLibrary.simpleMessage("Entry name"),
        "erType": MessageLookupByLibrary.simpleMessage("Examiner report"),
        "examinerReportItem":
            MessageLookupByLibrary.simpleMessage("Examiner Report"),
        "fieldsNotFilledError": MessageLookupByLibrary.simpleMessage(
            "Some fields are not filled in"),
        "fileNameHeading": MessageLookupByLibrary.simpleMessage("File name"),
        "folderType": MessageLookupByLibrary.simpleMessage("Folder"),
        "gradeThresholdsItem":
            MessageLookupByLibrary.simpleMessage("Grade Thresholds"),
        "gtType": MessageLookupByLibrary.simpleMessage("Grade thresholds"),
        "homeLocation": MessageLookupByLibrary.simpleMessage("Home"),
        "inType": MessageLookupByLibrary.simpleMessage("Insert"),
        "languageTag": MessageLookupByLibrary.simpleMessage("Language"),
        "lightButton": MessageLookupByLibrary.simpleMessage("Light"),
        "markSchemeItem": MessageLookupByLibrary.simpleMessage("Mark Scheme"),
        "msType": MessageLookupByLibrary.simpleMessage("Mark scheme"),
        "otherPaperTypesItem": MessageLookupByLibrary.simpleMessage("Others"),
        "otherSeasonsItem":
            MessageLookupByLibrary.simpleMessage("Other Seasons"),
        "otherType": MessageLookupByLibrary.simpleMessage("Other file"),
        "paperNumberMessage": m0,
        "paperTypeMessage": m1,
        "paperTypeTag": MessageLookupByLibrary.simpleMessage("Paper type"),
        "papersHeading": MessageLookupByLibrary.simpleMessage("Papers"),
        "papersSelectedTag": m2,
        "paypalButton": MessageLookupByLibrary.simpleMessage("PayPal"),
        "progressHeading": MessageLookupByLibrary.simpleMessage("Progress"),
        "qpType": MessageLookupByLibrary.simpleMessage("Question paper"),
        "qrType": MessageLookupByLibrary.simpleMessage("Transcript"),
        "questionPaperItem":
            MessageLookupByLibrary.simpleMessage("Question Paper"),
        "removeAllButton": MessageLookupByLibrary.simpleMessage("Remove all"),
        "revealDownloadsFolder":
            MessageLookupByLibrary.simpleMessage("Reveal Downloads Folder"),
        "roadmapContent": MessageLookupByLibrary.simpleMessage(
            "This is the updating roadmap of Past Paper Finder."),
        "roadmapContent1": MessageLookupByLibrary.simpleMessage("Development"),
        "roadmapContent2":
            MessageLookupByLibrary.simpleMessage("Alpha Testing"),
        "roadmapContent3": MessageLookupByLibrary.simpleMessage("Beta Testing"),
        "roadmapContent4": MessageLookupByLibrary.simpleMessage("Release"),
        "roadmapTag": MessageLookupByLibrary.simpleMessage("Roadmap"),
        "rpType": MessageLookupByLibrary.simpleMessage("Speaking assessment"),
        "seasonSelectedMessage": m3,
        "seasonsTag": MessageLookupByLibrary.simpleMessage("Seasons"),
        "seemsNoCollection": MessageLookupByLibrary.simpleMessage(
            "Seems like you did not add anything to collection yet"),
        "seemsNoDownload": MessageLookupByLibrary.simpleMessage(
            "Seems like there\'s nothing to download"),
        "seemsNoSelection": MessageLookupByLibrary.simpleMessage(
            "Seems like you did not selected any papers yet"),
        "selectAllButton": MessageLookupByLibrary.simpleMessage("Select all"),
        "selectDownloadPathButton":
            MessageLookupByLibrary.simpleMessage("Select download path"),
        "selectNoneButton": MessageLookupByLibrary.simpleMessage("Select none"),
        "selectPaperNumbersHint":
            MessageLookupByLibrary.simpleMessage("Select paper numbers"),
        "selectPaperTypesHint":
            MessageLookupByLibrary.simpleMessage("Select paper types"),
        "selectSeasonHint":
            MessageLookupByLibrary.simpleMessage("Select season"),
        "selectSubjectHint":
            MessageLookupByLibrary.simpleMessage("Select subject"),
        "selectedPapersTitle":
            MessageLookupByLibrary.simpleMessage("Selected papers"),
        "settingsSidebar": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "sfType": MessageLookupByLibrary.simpleMessage("Source files"),
        "showDownloadedButton":
            MessageLookupByLibrary.simpleMessage("Show Downloaded"),
        "siType": MessageLookupByLibrary.simpleMessage("Specimen insert"),
        "simultaneousDownloadsTag":
            MessageLookupByLibrary.simpleMessage("Simultaneous downloads"),
        "smType": MessageLookupByLibrary.simpleMessage("Specimen mark scheme"),
        "spType": MessageLookupByLibrary.simpleMessage("Specimen paper"),
        "specimenMarkSchemeItem":
            MessageLookupByLibrary.simpleMessage("Specimen Mark Scheme"),
        "specimenPaperItem":
            MessageLookupByLibrary.simpleMessage("Specimen Paper"),
        "sponsorNote": MessageLookupByLibrary.simpleMessage(
            "If you wish to appear in the sponsors list, please send a email to micfong2@outlook.com with the amount donated, time of donation, your name (or nickname you want to show), and your avatar. Thank you for your donation!"),
        "sponsorTag": MessageLookupByLibrary.simpleMessage("Sponsor me"),
        "springItem":
            MessageLookupByLibrary.simpleMessage("Spring (February - March)"),
        "suType": MessageLookupByLibrary.simpleMessage("Syllabus update"),
        "subjectCodeHeading":
            MessageLookupByLibrary.simpleMessage("Subject code"),
        "subjectNameHeading":
            MessageLookupByLibrary.simpleMessage("Subject name"),
        "subjectsTitle": MessageLookupByLibrary.simpleMessage("Subjects"),
        "summerItem":
            MessageLookupByLibrary.simpleMessage("Summer (May - June)"),
        "syType": MessageLookupByLibrary.simpleMessage("Syllabus"),
        "syllabusTag": MessageLookupByLibrary.simpleMessage("Syllabus"),
        "tapToCancelHint":
            MessageLookupByLibrary.simpleMessage("Tap to cancel any download"),
        "tapToRemoveHint": MessageLookupByLibrary.simpleMessage(
            "Tap to remove any single item"),
        "testingBadge":
            MessageLookupByLibrary.simpleMessage("Alpha Testing Stage"),
        "testingBannerContent": MessageLookupByLibrary.simpleMessage(
            "Thank you for participating in Past Paper Finder Alpha test!"),
        "testingBannerTitle":
            MessageLookupByLibrary.simpleMessage("You\'re in test"),
        "testingSidebar": MessageLookupByLibrary.simpleMessage("Alpha Test"),
        "testingTitle": MessageLookupByLibrary.simpleMessage("Alpha Test"),
        "tnType": MessageLookupByLibrary.simpleMessage("Examiner\'s notes"),
        "typeHeading": MessageLookupByLibrary.simpleMessage("Type"),
        "updatesButton":
            MessageLookupByLibrary.simpleMessage("View Latest Version"),
        "updatesContent": MessageLookupByLibrary.simpleMessage(
            "Updates are expected to be released very frequently. Please do often check for updates."),
        "updatesTag": MessageLookupByLibrary.simpleMessage("Updates"),
        "versionTag": MessageLookupByLibrary.simpleMessage("Alpha version"),
        "viewSelectionButton":
            MessageLookupByLibrary.simpleMessage("View Selection"),
        "waitingProgress": MessageLookupByLibrary.simpleMessage("Waiting"),
        "wechatpayButton": MessageLookupByLibrary.simpleMessage("WeChat Pay"),
        "winterItem":
            MessageLookupByLibrary.simpleMessage("Winter (October - November)"),
        "yearRangeTag": MessageLookupByLibrary.simpleMessage("Year range")
      };
}
