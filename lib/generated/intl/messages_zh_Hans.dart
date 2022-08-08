// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans locale. All the
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
  String get localeName => 'zh_Hans';

  static String m0(count) =>
      "${Intl.plural(count, other: '已选择 ${count} 个试卷编号')}";

  static String m1(count) =>
      "${Intl.plural(count, other: '已选择 ${count} 种试卷类型')}";

  static String m2(count) => "${Intl.plural(count, other: '已选 ${count} 张')}";

  static String m3(count) =>
      "${Intl.plural(count, other: '已选择 ${count} 个考试季')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutSidebar": MessageLookupByLibrary.simpleMessage("关于"),
        "aboutTestingContent":
            MessageLookupByLibrary.simpleMessage("大量开发工作仍在进行中，所以软件可能发生不稳定的错误。"),
        "aboutTestingTag": MessageLookupByLibrary.simpleMessage("关于测试版"),
        "aboutTitle":
            MessageLookupByLibrary.simpleMessage("关于 Past Paper Finder"),
        "addToCollectionButton": MessageLookupByLibrary.simpleMessage("添加至收集箱"),
        "alipayButton": MessageLookupByLibrary.simpleMessage("支付宝"),
        "appearanceTag": MessageLookupByLibrary.simpleMessage("外观"),
        "autoButton": MessageLookupByLibrary.simpleMessage("自动"),
        "batchSidebar": MessageLookupByLibrary.simpleMessage("批量下载"),
        "batchTitle": MessageLookupByLibrary.simpleMessage("批量下载"),
        "browseSidebar": MessageLookupByLibrary.simpleMessage("检索试卷"),
        "browseTitle": MessageLookupByLibrary.simpleMessage("检索试卷"),
        "bugAndFeatureContent1": MessageLookupByLibrary.simpleMessage(
            "Alpha 测试正是为了版本快速迭代而设计的，所以请尽多反馈错误漏洞和新功能请求！"),
        "bugAndFeatureContent2": MessageLookupByLibrary.simpleMessage(
            "请报告此类信息至 Micfong 的微信（推荐），或发送邮件至 micfong2@outlook.com。"),
        "bugAndFeatureTag": MessageLookupByLibrary.simpleMessage("报告漏洞与请求功能"),
        "cancelAllButton": MessageLookupByLibrary.simpleMessage("全部取消"),
        "ciType": MessageLookupByLibrary.simpleMessage("机密说明"),
        "collectedTimeHeading": MessageLookupByLibrary.simpleMessage("收集时间"),
        "collectionSidebar": MessageLookupByLibrary.simpleMessage("收集箱"),
        "collectionTitle": MessageLookupByLibrary.simpleMessage("收集箱"),
        "commitTag": MessageLookupByLibrary.simpleMessage("上次提交为 "),
        "confidentialInstructionsItem":
            MessageLookupByLibrary.simpleMessage("机密说明"),
        "createdByTag":
            MessageLookupByLibrary.simpleMessage("由 Micfong 作为 SCIE.DEV 的一员开发"),
        "darkButton": MessageLookupByLibrary.simpleMessage("深色"),
        "downloadAllButton": MessageLookupByLibrary.simpleMessage("全部下载"),
        "downloadButton": MessageLookupByLibrary.simpleMessage("下载"),
        "downloadFailedMessage":
            MessageLookupByLibrary.simpleMessage("您未指定下载路径，请在设置页面选择一个路径。"),
        "downloadFailedProgress": MessageLookupByLibrary.simpleMessage("下载失败"),
        "downloadFailedTitle": MessageLookupByLibrary.simpleMessage("下载失败"),
        "downloadPathTag": MessageLookupByLibrary.simpleMessage("下载路径"),
        "downloadsSidebar": MessageLookupByLibrary.simpleMessage("下载队列"),
        "downloadsTitle": MessageLookupByLibrary.simpleMessage("下载队列"),
        "entryNameHeading": MessageLookupByLibrary.simpleMessage("项目名称"),
        "erType": MessageLookupByLibrary.simpleMessage("考官报告"),
        "examinerReportItem": MessageLookupByLibrary.simpleMessage("考官报告"),
        "fieldsNotFilledError": MessageLookupByLibrary.simpleMessage("有必填项未填写"),
        "fileNameHeading": MessageLookupByLibrary.simpleMessage("文件名"),
        "folderType": MessageLookupByLibrary.simpleMessage("文件夹"),
        "gradeThresholdsItem": MessageLookupByLibrary.simpleMessage("等级阈值"),
        "gtType": MessageLookupByLibrary.simpleMessage("等级阈值"),
        "homeLocation": MessageLookupByLibrary.simpleMessage("根目录"),
        "inType": MessageLookupByLibrary.simpleMessage("插页"),
        "languageTag": MessageLookupByLibrary.simpleMessage("语言"),
        "lightButton": MessageLookupByLibrary.simpleMessage("浅色"),
        "markSchemeItem": MessageLookupByLibrary.simpleMessage("评分标准"),
        "msType": MessageLookupByLibrary.simpleMessage("评分标准"),
        "otherPaperTypesItem": MessageLookupByLibrary.simpleMessage("其他试卷类型"),
        "otherSeasonsItem": MessageLookupByLibrary.simpleMessage("其他考试季"),
        "otherType": MessageLookupByLibrary.simpleMessage("其他文件"),
        "paperNumberMessage": m0,
        "paperTypeMessage": m1,
        "paperTypeTag": MessageLookupByLibrary.simpleMessage("试卷类型"),
        "papersHeading": MessageLookupByLibrary.simpleMessage("试卷数"),
        "papersSelectedTag": m2,
        "paypalButton": MessageLookupByLibrary.simpleMessage("PayPal"),
        "progressHeading": MessageLookupByLibrary.simpleMessage("下载进度"),
        "qpType": MessageLookupByLibrary.simpleMessage("问卷"),
        "qrType": MessageLookupByLibrary.simpleMessage("抄本"),
        "questionPaperItem": MessageLookupByLibrary.simpleMessage("问卷"),
        "removeAllButton": MessageLookupByLibrary.simpleMessage("全部移除"),
        "revealDownloadsFolder":
            MessageLookupByLibrary.simpleMessage("打开下载文件夹"),
        "roadmapContent": MessageLookupByLibrary.simpleMessage(
            "以下为 Past Paper Finder 的迭代路线图。"),
        "roadmapContent1": MessageLookupByLibrary.simpleMessage("开发阶段"),
        "roadmapContent2": MessageLookupByLibrary.simpleMessage("Alpha 测试"),
        "roadmapContent3": MessageLookupByLibrary.simpleMessage("Beta 测试"),
        "roadmapContent4": MessageLookupByLibrary.simpleMessage("正式版发布"),
        "roadmapTag": MessageLookupByLibrary.simpleMessage("迭代路线图"),
        "rpType": MessageLookupByLibrary.simpleMessage("口语测评"),
        "seasonSelectedMessage": m3,
        "seasonsTag": MessageLookupByLibrary.simpleMessage("考试季"),
        "seemsNoCollection":
            MessageLookupByLibrary.simpleMessage("您似乎未在收集箱中添加任何项目"),
        "seemsNoDownload": MessageLookupByLibrary.simpleMessage("下载队列似乎是空的"),
        "seemsNoSelection": MessageLookupByLibrary.simpleMessage("您似乎未选择任何试卷"),
        "selectAllButton": MessageLookupByLibrary.simpleMessage("全选"),
        "selectDownloadPathButton":
            MessageLookupByLibrary.simpleMessage("选择下载路径"),
        "selectNoneButton": MessageLookupByLibrary.simpleMessage("全不选"),
        "selectPaperNumbersHint":
            MessageLookupByLibrary.simpleMessage("选择试卷编号"),
        "selectPaperTypesHint": MessageLookupByLibrary.simpleMessage("选择试卷类型"),
        "selectSeasonHint": MessageLookupByLibrary.simpleMessage("选择考试季"),
        "selectSubjectHint": MessageLookupByLibrary.simpleMessage("选择科目"),
        "selectedPapersTitle": MessageLookupByLibrary.simpleMessage("已选试卷"),
        "settingsSidebar": MessageLookupByLibrary.simpleMessage("设置"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
        "sfType": MessageLookupByLibrary.simpleMessage("源文件"),
        "showDownloadedButton": MessageLookupByLibrary.simpleMessage("显示下载完成项"),
        "siType": MessageLookupByLibrary.simpleMessage("样例插页"),
        "simultaneousDownloadsTag":
            MessageLookupByLibrary.simpleMessage("同时下载数"),
        "smType": MessageLookupByLibrary.simpleMessage("样例评分标准"),
        "spType": MessageLookupByLibrary.simpleMessage("样例问卷"),
        "specimenMarkSchemeItem":
            MessageLookupByLibrary.simpleMessage("样例评分标准"),
        "specimenPaperItem": MessageLookupByLibrary.simpleMessage("样例问卷"),
        "sponsorNote": MessageLookupByLibrary.simpleMessage(
            "如果您希望让您的姓名（或昵称）出现在支持列表中，请发送邮件至 micfong2@outlook.com，包含支持金额，支持时间，您的姓名（或昵称），以及您的头像。感谢您的支持！"),
        "sponsorTag": MessageLookupByLibrary.simpleMessage("支持一下"),
        "springItem": MessageLookupByLibrary.simpleMessage("春季（二月至三月）"),
        "suType": MessageLookupByLibrary.simpleMessage("课纲更新"),
        "subjectCodeHeading": MessageLookupByLibrary.simpleMessage("科目代码"),
        "subjectNameHeading": MessageLookupByLibrary.simpleMessage("科目名称"),
        "subjectsTitle": MessageLookupByLibrary.simpleMessage("科目"),
        "summerItem": MessageLookupByLibrary.simpleMessage("夏季（五月至六月）"),
        "syType": MessageLookupByLibrary.simpleMessage("课程大纲"),
        "syllabusTag": MessageLookupByLibrary.simpleMessage("考纲"),
        "tapToCancelHint": MessageLookupByLibrary.simpleMessage("单击以取消任意下载"),
        "tapToRemoveHint": MessageLookupByLibrary.simpleMessage("单击以移除任意项"),
        "testingBadge": MessageLookupByLibrary.simpleMessage("Alpha 测试阶段"),
        "testingBannerContent": MessageLookupByLibrary.simpleMessage(
            "感谢您参加 Past Paper Finder Alpha 测试！"),
        "testingBannerTitle": MessageLookupByLibrary.simpleMessage("正在使用测试版"),
        "testingSidebar": MessageLookupByLibrary.simpleMessage("Alpha 测试"),
        "testingTitle": MessageLookupByLibrary.simpleMessage("Alpha 测试版"),
        "tnType": MessageLookupByLibrary.simpleMessage("考官备注"),
        "typeHeading": MessageLookupByLibrary.simpleMessage("类型"),
        "updatesButton": MessageLookupByLibrary.simpleMessage("查看最新版本"),
        "updatesContent": MessageLookupByLibrary.simpleMessage(
            "我将会频繁发布更新，所以请经常来检查是否正在使用最新版本。"),
        "updatesTag": MessageLookupByLibrary.simpleMessage("更新"),
        "versionTag": MessageLookupByLibrary.simpleMessage("Alpha 版"),
        "viewSelectionButton": MessageLookupByLibrary.simpleMessage("查看已选试卷"),
        "waitingProgress": MessageLookupByLibrary.simpleMessage("等待中"),
        "wechatpayButton": MessageLookupByLibrary.simpleMessage("微信支付"),
        "winterItem": MessageLookupByLibrary.simpleMessage("冬季（十月至十一月）"),
        "yearRangeTag": MessageLookupByLibrary.simpleMessage("年份")
      };
}
