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
        "aboutTitle":
            MessageLookupByLibrary.simpleMessage("About Past Paper Finder"),
        "addToCollectionButton":
            MessageLookupByLibrary.simpleMessage("Add to Collection"),
        "appearanceTag": MessageLookupByLibrary.simpleMessage("Appearance"),
        "autoButton": MessageLookupByLibrary.simpleMessage("Auto"),
        "batchSidebar": MessageLookupByLibrary.simpleMessage("Batch"),
        "batchTitle": MessageLookupByLibrary.simpleMessage("Batch Downloads"),
        "browseSidebar": MessageLookupByLibrary.simpleMessage("Browse"),
        "browseTitle": MessageLookupByLibrary.simpleMessage("Browse Papers"),
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
        "downloadFailedProgress":
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
        "progressHeading": MessageLookupByLibrary.simpleMessage("Progress"),
        "qpType": MessageLookupByLibrary.simpleMessage("Question paper"),
        "qrType": MessageLookupByLibrary.simpleMessage("Transcript"),
        "questionPaperItem":
            MessageLookupByLibrary.simpleMessage("Question Paper"),
        "removeAllButton": MessageLookupByLibrary.simpleMessage("Remove all"),
        "revealDownloadsFolder":
            MessageLookupByLibrary.simpleMessage("Reveal Downloads Folder"),
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
        "tnType": MessageLookupByLibrary.simpleMessage("Examiner\'s notes"),
        "typeHeading": MessageLookupByLibrary.simpleMessage("Type"),
        "versionTag":
            MessageLookupByLibrary.simpleMessage("Development version"),
        "viewSelectionButton":
            MessageLookupByLibrary.simpleMessage("View Selection"),
        "waitingProgress": MessageLookupByLibrary.simpleMessage("Waiting"),
        "winterItem":
            MessageLookupByLibrary.simpleMessage("Winter (October - November)"),
        "yearRangeTag": MessageLookupByLibrary.simpleMessage("Year range")
      };
}
