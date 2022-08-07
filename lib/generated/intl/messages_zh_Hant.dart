// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant locale. All the
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
  String get localeName => 'zh_Hant';

  static String m0(count) =>
      "${Intl.plural(count, other: '已選擇 ${count} 個試卷編號')}";

  static String m1(count) =>
      "${Intl.plural(count, other: '已選擇 ${count} 種試卷類型')}";

  static String m2(count) => "${Intl.plural(count, other: '已選 ${count} 張')}";

  static String m3(count) =>
      "${Intl.plural(count, other: '已選擇 ${count} 個考試季')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutSidebar": MessageLookupByLibrary.simpleMessage("關於"),
        "aboutTitle":
            MessageLookupByLibrary.simpleMessage("關於 Past Paper Finder"),
        "addToCollectionButton": MessageLookupByLibrary.simpleMessage("添加至收集箱"),
        "alipayButton": MessageLookupByLibrary.simpleMessage("支付宝"),
        "appearanceTag": MessageLookupByLibrary.simpleMessage("外觀"),
        "autoButton": MessageLookupByLibrary.simpleMessage("自動"),
        "batchSidebar": MessageLookupByLibrary.simpleMessage("批量下載"),
        "batchTitle": MessageLookupByLibrary.simpleMessage("批量下載"),
        "browseSidebar": MessageLookupByLibrary.simpleMessage("檢索試卷"),
        "browseTitle": MessageLookupByLibrary.simpleMessage("檢索試卷"),
        "cancelAllButton": MessageLookupByLibrary.simpleMessage("全部取消"),
        "ciType": MessageLookupByLibrary.simpleMessage("機密說明"),
        "collectedTimeHeading": MessageLookupByLibrary.simpleMessage("收集時間"),
        "collectionSidebar": MessageLookupByLibrary.simpleMessage("收集箱"),
        "collectionTitle": MessageLookupByLibrary.simpleMessage("收集箱"),
        "commitTag": MessageLookupByLibrary.simpleMessage("上次提交為 "),
        "confidentialInstructionsItem":
            MessageLookupByLibrary.simpleMessage("機密說明"),
        "createdByTag":
            MessageLookupByLibrary.simpleMessage("由 Micfong 作為 SCIE.DEV 的一員開發"),
        "darkButton": MessageLookupByLibrary.simpleMessage("深色"),
        "downloadAllButton": MessageLookupByLibrary.simpleMessage("全部下載"),
        "downloadButton": MessageLookupByLibrary.simpleMessage("下載"),
        "downloadFailedMessage":
            MessageLookupByLibrary.simpleMessage("您未指定下載路徑，請在設置頁面選擇一個路徑。"),
        "downloadFailedProgress": MessageLookupByLibrary.simpleMessage("下載失敗"),
        "downloadFailedTitle": MessageLookupByLibrary.simpleMessage("下載失敗"),
        "downloadPathTag": MessageLookupByLibrary.simpleMessage("下載路徑"),
        "downloadsSidebar": MessageLookupByLibrary.simpleMessage("下載隊列"),
        "downloadsTitle": MessageLookupByLibrary.simpleMessage("下載隊列"),
        "entryNameHeading": MessageLookupByLibrary.simpleMessage("項目名稱"),
        "erType": MessageLookupByLibrary.simpleMessage("考官報告"),
        "examinerReportItem": MessageLookupByLibrary.simpleMessage("考官報告"),
        "fieldsNotFilledError": MessageLookupByLibrary.simpleMessage("有必填項未填寫"),
        "fileNameHeading": MessageLookupByLibrary.simpleMessage("文件名"),
        "folderType": MessageLookupByLibrary.simpleMessage("文件夾"),
        "gradeThresholdsItem": MessageLookupByLibrary.simpleMessage("等級閾值"),
        "gtType": MessageLookupByLibrary.simpleMessage("等級閾值"),
        "homeLocation": MessageLookupByLibrary.simpleMessage("根目錄"),
        "inType": MessageLookupByLibrary.simpleMessage("插頁"),
        "languageTag": MessageLookupByLibrary.simpleMessage("語言"),
        "lightButton": MessageLookupByLibrary.simpleMessage("淺色"),
        "markSchemeItem": MessageLookupByLibrary.simpleMessage("評分標準"),
        "msType": MessageLookupByLibrary.simpleMessage("評分標準"),
        "otherPaperTypesItem": MessageLookupByLibrary.simpleMessage("其他試卷類型"),
        "otherSeasonsItem": MessageLookupByLibrary.simpleMessage("其他考試季"),
        "otherType": MessageLookupByLibrary.simpleMessage("其他文件"),
        "paperNumberMessage": m0,
        "paperTypeMessage": m1,
        "paperTypeTag": MessageLookupByLibrary.simpleMessage("試卷類型"),
        "papersHeading": MessageLookupByLibrary.simpleMessage("試卷數"),
        "papersSelectedTag": m2,
        "paypalButton": MessageLookupByLibrary.simpleMessage("PayPal"),
        "progressHeading": MessageLookupByLibrary.simpleMessage("下載進度"),
        "qpType": MessageLookupByLibrary.simpleMessage("問卷"),
        "qrType": MessageLookupByLibrary.simpleMessage("抄本"),
        "questionPaperItem": MessageLookupByLibrary.simpleMessage("問卷"),
        "removeAllButton": MessageLookupByLibrary.simpleMessage("全部移除"),
        "revealDownloadsFolder":
            MessageLookupByLibrary.simpleMessage("打開下載文件夾"),
        "rpType": MessageLookupByLibrary.simpleMessage("口語測評"),
        "seasonSelectedMessage": m3,
        "seasonsTag": MessageLookupByLibrary.simpleMessage("考試季"),
        "seemsNoCollection":
            MessageLookupByLibrary.simpleMessage("您似乎未在收集箱中添加任何項目"),
        "seemsNoDownload": MessageLookupByLibrary.simpleMessage("下載隊列似乎是空的"),
        "seemsNoSelection": MessageLookupByLibrary.simpleMessage("您似乎未選擇任何試卷"),
        "selectAllButton": MessageLookupByLibrary.simpleMessage("全選"),
        "selectDownloadPathButton":
            MessageLookupByLibrary.simpleMessage("選擇下載路徑"),
        "selectNoneButton": MessageLookupByLibrary.simpleMessage("全不選"),
        "selectPaperNumbersHint":
            MessageLookupByLibrary.simpleMessage("選擇試卷編號"),
        "selectPaperTypesHint": MessageLookupByLibrary.simpleMessage("選擇試卷類型"),
        "selectSeasonHint": MessageLookupByLibrary.simpleMessage("選擇考試季"),
        "selectSubjectHint": MessageLookupByLibrary.simpleMessage("選擇科目"),
        "selectedPapersTitle": MessageLookupByLibrary.simpleMessage("已選試卷"),
        "settingsSidebar": MessageLookupByLibrary.simpleMessage("設置"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("設置"),
        "sfType": MessageLookupByLibrary.simpleMessage("源文件"),
        "showDownloadedButton": MessageLookupByLibrary.simpleMessage("顯示下載完成項"),
        "siType": MessageLookupByLibrary.simpleMessage("樣例插頁"),
        "simultaneousDownloadsTag":
            MessageLookupByLibrary.simpleMessage("同時下載數"),
        "smType": MessageLookupByLibrary.simpleMessage("樣例評分標準"),
        "spType": MessageLookupByLibrary.simpleMessage("樣例問卷"),
        "specimenMarkSchemeItem":
            MessageLookupByLibrary.simpleMessage("樣例評分標準"),
        "specimenPaperItem": MessageLookupByLibrary.simpleMessage("樣例問卷"),
        "sponsorNote": MessageLookupByLibrary.simpleMessage(
            "如果您希望讓您的姓名（或暱稱）出現在支持列表中，請發送郵件至 micfong2@outlook.com，包含支持金額，支持時間，您的姓名（或暱稱），以及您的頭像。感謝您的支持！"),
        "sponsorTag": MessageLookupByLibrary.simpleMessage("支持一下"),
        "springItem": MessageLookupByLibrary.simpleMessage("春季（二月至三月）"),
        "suType": MessageLookupByLibrary.simpleMessage("課綱更新"),
        "subjectCodeHeading": MessageLookupByLibrary.simpleMessage("科目代碼"),
        "subjectNameHeading": MessageLookupByLibrary.simpleMessage("科目名稱"),
        "subjectsTitle": MessageLookupByLibrary.simpleMessage("科目"),
        "summerItem": MessageLookupByLibrary.simpleMessage("夏季（五月至六月）"),
        "syType": MessageLookupByLibrary.simpleMessage("課程大綱"),
        "syllabusTag": MessageLookupByLibrary.simpleMessage("考綱"),
        "tapToCancelHint": MessageLookupByLibrary.simpleMessage("單擊以取消任意下載"),
        "tapToRemoveHint": MessageLookupByLibrary.simpleMessage("單擊以移除任意項"),
        "tnType": MessageLookupByLibrary.simpleMessage("考官備注"),
        "typeHeading": MessageLookupByLibrary.simpleMessage("類型"),
        "versionTag": MessageLookupByLibrary.simpleMessage("開發版"),
        "viewSelectionButton": MessageLookupByLibrary.simpleMessage("查看已選試卷"),
        "waitingProgress": MessageLookupByLibrary.simpleMessage("等待中"),
        "wechatpayButton": MessageLookupByLibrary.simpleMessage("微信支付"),
        "winterItem": MessageLookupByLibrary.simpleMessage("冬季（十月至十一月）"),
        "yearRangeTag": MessageLookupByLibrary.simpleMessage("年份")
      };
}
