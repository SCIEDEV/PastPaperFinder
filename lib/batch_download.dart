import 'package:flutter/material.dart';
import 'package:past_paper/colors.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'select_subject.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'paper_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets.dart';

class BatchDownloadPage extends StatelessWidget {
  const BatchDownloadPage({
    Key? key,
    required this.globalContext,
  }) : super(key: key);
  final BuildContext globalContext;
  @override
  Widget build(BuildContext context) {
    List<dynamic> seasons = [
      ['m', AppLocalizations.of(context)!.springItem, UniconsLine.trees],
      ['s', AppLocalizations.of(context)!.summerItem, UniconsLine.sun],
      ['w', AppLocalizations.of(context)!.winterItem, UniconsLine.snow_flake],
      [
        'o',
        AppLocalizations.of(context)!.otherSeasonsItem,
        UniconsLine.ellipsis_h
      ],
    ];

    const List<dynamic> paperNumbers = [
      ['1', 'Paper 1', Icons.looks_one_outlined],
      ['2', 'Paper 2', Icons.looks_two_outlined],
      ['3', 'Paper 3', Icons.looks_3_outlined],
      ['4', 'Paper 4', Icons.looks_4_outlined],
      ['5', 'Paper 5', Icons.looks_5_outlined],
      ['6', 'Paper 6', Icons.looks_6_outlined],
    ];

    List<dynamic> paperTypes = [
      [
        'qp',
        AppLocalizations.of(context)!.questionPaperItem,
        UniconsLine.file_question_alt
      ],
      [
        'ms',
        AppLocalizations.of(context)!.markSchemeItem,
        UniconsLine.file_check_alt
      ],
      [
        'sp',
        AppLocalizations.of(context)!.specimenPaperItem,
        UniconsLine.file_bookmark_alt
      ],
      [
        'sm',
        AppLocalizations.of(context)!.specimenMarkSchemeItem,
        UniconsLine.file_bookmark_alt
      ],
      [
        'er',
        AppLocalizations.of(context)!.examinerReportItem,
        UniconsLine.file_search_alt
      ],
      [
        'gt',
        AppLocalizations.of(context)!.gradeThresholdsItem,
        UniconsLine.file_graph
      ],
      [
        'ci',
        AppLocalizations.of(context)!.confidentialInstructionsItem,
        UniconsLine.file_info_alt
      ],
      [
        'ot',
        AppLocalizations.of(context)!.otherPaperTypesItem,
        UniconsLine.copy_alt
      ],
    ];

    bool accessible = (context.watch<BatchPreferences>().subject != "") &&
        (context.watch<BatchPreferences>().seasons.isNotEmpty) &&
        (context.watch<BatchPreferences>().paperNumbers.isNotEmpty) &&
        (context.watch<BatchPreferences>().paperTypes.isNotEmpty);

    MColors mcol = MColors(context.watch<Appearance>().darkMode);

    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          AppLocalizations.of(context)!.batchTitle,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: mcol.primary),
        ),
        Container(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(AppLocalizations.of(context)!.syllabusTag,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonGroup(),
                  const SizedBox(height: 20),
                  LongButton(
                      title: context.watch<BatchPreferences>().subject == ""
                          ? AppLocalizations.of(context)!.selectSubjectHint
                          : context.read<BatchPreferences>().subject,
                      leading: UniconsLine.book_alt,
                      trailing: UniconsLine.angle_right,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectSubjectPage(),
                                fullscreenDialog: true));
                      },
                      placeholder:
                          (context.watch<BatchPreferences>().subject == ""))
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const VertDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(AppLocalizations.of(context)!.yearRangeTag,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary)),
            ),
            const Expanded(
              flex: 6,
              child: YearRangeSlider(),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const VertDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(AppLocalizations.of(context)!.seasonsTag,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LongButton(
                        title: context.watch<BatchPreferences>().seasons.isEmpty
                            ? AppLocalizations.of(context)!.selectSeasonHint
                            : AppLocalizations.of(context)!
                                .seasonSelectedMessage(context
                                    .read<BatchPreferences>()
                                    .seasons
                                    .length),
                        leading: UniconsLine.calender,
                        trailing:
                            context.watch<BatchPreferences>().selectSeasonOpen
                                ? UniconsLine.angle_up
                                : UniconsLine.angle_down,
                        onPressed: () {
                          context.read<BatchPreferences>().toggleSelectSeason();
                        },
                        placeholder:
                            context.read<BatchPreferences>().seasons.isEmpty,
                        radiusMode:
                            context.watch<BatchPreferences>().selectSeasonOpen
                                ? 1
                                : 0),
                    if (context.watch<BatchPreferences>().selectSeasonOpen) ...[
                      if (context.read<BatchPreferences>().seasons.length ==
                          seasons.length)
                        LongButton(
                            title:
                                AppLocalizations.of(context)!.selectNoneButton,
                            leading: null,
                            trailing: null,
                            onPressed: () {
                              context
                                  .read<BatchPreferences>()
                                  .changeSeasons([]);
                            },
                            isMenuItem: true,
                            radiusMode: 3,
                            transformOffset: 1)
                      else
                        LongButton(
                            title:
                                AppLocalizations.of(context)!.selectAllButton,
                            leading: null,
                            trailing: null,
                            onPressed: () {
                              context.read<BatchPreferences>().changeSeasons(
                                  [for (var i = 0; i < seasons.length; i++) i]);
                            },
                            isMenuItem: true,
                            radiusMode: 3,
                            transformOffset: 1),
                      for (var index = 0; index < seasons.length; index++)
                        LongButton(
                            title: seasons[index][1],
                            leading: seasons[index][2],
                            trailing: context
                                    .watch<BatchPreferences>()
                                    .seasons
                                    .contains(index)
                                ? UniconsLine.check
                                : null,
                            onPressed: () {
                              context
                                  .read<BatchPreferences>()
                                  .toggleSeason(index);
                            },
                            radiusMode: index == (seasons.length - 1) ? 2 : 3,
                            transformOffset: (index + 2).toDouble(),
                            isMenuItem: true)
                    ],
                  ]),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const VertDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(AppLocalizations.of(context)!.paperTypeTag,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      LongButton(
                          title: context
                                  .watch<BatchPreferences>()
                                  .paperNumbers
                                  .isEmpty
                              ? AppLocalizations.of(context)!
                                  .selectPaperNumbersHint
                              : AppLocalizations.of(context)!
                                  .paperNumberMessage(context
                                      .read<BatchPreferences>()
                                      .paperNumbers
                                      .length),
                          leading: UniconsLine.list_ol_alt,
                          trailing: context
                                  .watch<BatchPreferences>()
                                  .selectPaperNumberOpen
                              ? UniconsLine.angle_up
                              : UniconsLine.angle_down,
                          onPressed: () {
                            context
                                .read<BatchPreferences>()
                                .toggleSelectPaperNumber();
                          },
                          placeholder: context
                              .read<BatchPreferences>()
                              .paperNumbers
                              .isEmpty,
                          radiusMode: context
                                  .watch<BatchPreferences>()
                                  .selectPaperNumberOpen
                              ? 1
                              : 0),
                      if (context
                          .watch<BatchPreferences>()
                          .selectPaperNumberOpen) ...[
                        if (context
                                .read<BatchPreferences>()
                                .paperNumbers
                                .length ==
                            paperNumbers.length)
                          LongButton(
                              title: AppLocalizations.of(context)!
                                  .selectNoneButton,
                              leading: null,
                              trailing: null,
                              onPressed: () {
                                context
                                    .read<BatchPreferences>()
                                    .changePaperNumber([]);
                              },
                              isMenuItem: true,
                              radiusMode: 3,
                              transformOffset: 1)
                        else
                          LongButton(
                              title:
                                  AppLocalizations.of(context)!.selectAllButton,
                              leading: null,
                              trailing: null,
                              onPressed: () {
                                context
                                    .read<BatchPreferences>()
                                    .changePaperNumber([
                                  for (var i = 0; i < paperNumbers.length; i++)
                                    i
                                ]);
                              },
                              isMenuItem: true,
                              radiusMode: 3,
                              transformOffset: 1),
                        for (var index = 0;
                            index < paperNumbers.length;
                            index++)
                          LongButton(
                              title: paperNumbers[index][1],
                              leading: paperNumbers[index][2],
                              trailing: context
                                      .watch<BatchPreferences>()
                                      .paperNumbers
                                      .contains(index)
                                  ? UniconsLine.check
                                  : null,
                              onPressed: () {
                                context
                                    .read<BatchPreferences>()
                                    .togglePaperNumber(index);
                              },
                              radiusMode:
                                  index == (paperNumbers.length - 1) ? 2 : 3,
                              transformOffset: (index + 2).toDouble(),
                              isMenuItem: true)
                      ]
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LongButton(
                            title: context
                                    .watch<BatchPreferences>()
                                    .paperTypes
                                    .isEmpty
                                ? AppLocalizations.of(context)!
                                    .selectPaperTypesHint
                                : AppLocalizations.of(context)!
                                    .paperTypeMessage(context
                                        .read<BatchPreferences>()
                                        .paperTypes
                                        .length),
                            leading: UniconsLine.apps,
                            trailing: context
                                    .watch<BatchPreferences>()
                                    .selectPaperTypeOpen
                                ? UniconsLine.angle_up
                                : UniconsLine.angle_down,
                            onPressed: () {
                              context
                                  .read<BatchPreferences>()
                                  .toggleSelectPaperType();
                            },
                            placeholder: context
                                .read<BatchPreferences>()
                                .paperTypes
                                .isEmpty,
                            radiusMode: context
                                    .watch<BatchPreferences>()
                                    .selectPaperTypeOpen
                                ? 1
                                : 0),
                        if (context
                            .watch<BatchPreferences>()
                            .selectPaperTypeOpen) ...[
                          if (context
                                  .read<BatchPreferences>()
                                  .paperTypes
                                  .length ==
                              paperTypes.length)
                            LongButton(
                                title: AppLocalizations.of(context)!
                                    .selectNoneButton,
                                leading: null,
                                trailing: null,
                                onPressed: () {
                                  context
                                      .read<BatchPreferences>()
                                      .changePaperType([]);
                                },
                                isMenuItem: true,
                                radiusMode: 3,
                                transformOffset: 1)
                          else
                            LongButton(
                                title: AppLocalizations.of(context)!
                                    .selectAllButton,
                                leading: null,
                                trailing: null,
                                onPressed: () {
                                  context
                                      .read<BatchPreferences>()
                                      .changePaperType([
                                    for (var i = 0; i < paperTypes.length; i++)
                                      i
                                  ]);
                                },
                                isMenuItem: true,
                                radiusMode: 3,
                                transformOffset: 1),
                          for (var index = 0;
                              index < paperTypes.length;
                              index++)
                            LongButton(
                                title: paperTypes[index][1],
                                leading: paperTypes[index][2],
                                trailing: context
                                        .watch<BatchPreferences>()
                                        .paperTypes
                                        .contains(index)
                                    ? UniconsLine.check
                                    : null,
                                onPressed: () {
                                  context
                                      .read<BatchPreferences>()
                                      .togglePaperType(index);
                                },
                                radiusMode:
                                    index == (paperTypes.length - 1) ? 2 : 3,
                                transformOffset: (index + 2).toDouble(),
                                isMenuItem: true)
                        ],
                      ]),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const VertDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!accessible)
              Badge(
                  content: AppLocalizations.of(context)!.fieldsNotFilledError,
                  destructive: true),
            const SizedBox(width: 12),
            CustomButton(
              title: AppLocalizations.of(context)!.addToCollectionButton,
              onPressed: accessible
                  ? () {
                      CollectionItem collection = CollectionItem(
                          DateTime.now().toString(),
                          context.read<BatchPreferences>().syllabus,
                          context.read<BatchPreferences>().subject,
                          context.read<BatchPreferences>().beginYear,
                          context.read<BatchPreferences>().endYear,
                          context.read<BatchPreferences>().seasons.toList(),
                          context
                              .read<BatchPreferences>()
                              .paperNumbers
                              .toList(),
                          context.read<BatchPreferences>().paperTypes.toList(),
                          0);
                      context.read<CollectionStates>().addItem(collection);
                    }
                  : null,
            ),
            const SizedBox(width: 12),
            CustomButton(
              title: AppLocalizations.of(context)!.downloadButton,
              primary: true,
              onPressed: accessible
                  ? () {
                      if (context.read<Settings>().path == "") {
                        context
                            .read<DownloadStates>()
                            .setShowDownloadFailedOn(0);
                      } else {
                        context.read<DownloadStates>().setDownloads(
                            getPapers(CollectionItem(
                                DateTime.now().toString(),
                                context.read<BatchPreferences>().syllabus,
                                context.read<BatchPreferences>().subject,
                                context.read<BatchPreferences>().beginYear,
                                context.read<BatchPreferences>().endYear,
                                context
                                    .read<BatchPreferences>()
                                    .seasons
                                    .toList(),
                                context
                                    .read<BatchPreferences>()
                                    .paperNumbers
                                    .toList(),
                                context
                                    .read<BatchPreferences>()
                                    .paperTypes
                                    .toList(),
                                0)),
                            globalContext);
                      }
                    }
                  : null,
            ),
          ],
        ),
        if (context.watch<DownloadStates>().showDownloadFailedOn == 0) ...[
          Container(height: 16),
          const PathNotSpecifiedBanner(),
        ],
      ]),
    );
  }
}

class LongButton extends StatefulWidget {
  const LongButton(
      {Key? key,
      required this.title,
      this.leading,
      this.trailing,
      required this.onPressed,
      this.placeholder = true,
      this.radiusMode = 0,
      this.transformOffset = 0,
      this.isMenuItem = false})
      : super(key: key);
  final String title;
  final IconData? leading;
  final IconData? trailing;
  final Function() onPressed;
  final bool placeholder;
  final int radiusMode;
  final double transformOffset;
  final bool isMenuItem;
  @override
  State<LongButton> createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    var borderRadius = BorderRadius.zero;
    var transform = Matrix4.translationValues(0, 0, 0);
    if (widget.radiusMode == 0) {
      borderRadius = BorderRadius.circular(8);
    } else if (widget.radiusMode == 1) {
      borderRadius = const BorderRadius.vertical(top: Radius.circular(8));
    } else if (widget.radiusMode == 2) {
      borderRadius = const BorderRadius.vertical(bottom: Radius.circular(8));
      transform = Matrix4.translationValues(0, -widget.transformOffset, 0);
    } else {
      borderRadius = BorderRadius.zero;
      transform = Matrix4.translationValues(0, -widget.transformOffset, 0);
    }
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x1018281A),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: -2),
        BoxShadow(
            color: Color(0x1018280F),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: -2)
      ]),
      transform: transform,
      child: MaterialButton(
        color: mcol.buttonBackground,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        minWidth: double.infinity,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: mcol.buttonBorder),
        ),
        onPressed: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            children: [
              if (widget.isMenuItem) const SizedBox(width: 16),
              if (widget.leading != null)
                Icon(
                  widget.leading,
                  color: mcol.secondary,
                  size: 20,
                ),
              const SizedBox(width: 8),
              Expanded(
                flex: 99,
                child: Text(widget.title,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: (widget.placeholder && !widget.isMenuItem)
                            ? (mcol.secondary)
                            : (mcol.primary),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              const Spacer(flex: 1),
              if (widget.trailing != null)
                Icon(
                  widget.trailing,
                  color: mcol.secondary,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final bool? primary;
  final IconData? leading;
  final IconData? trailing;
  final Function()? onPressed;
  final bool destructive;
  const CustomButton(
      {Key? key,
      required this.title,
      this.leading,
      this.trailing,
      this.primary,
      required this.onPressed,
      this.destructive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    if (onPressed == null) {
      return MaterialButton(
        color: mcol.disabledButtonBackground,
        elevation: 0,
        disabledColor: mcol.disabledButtonBackground,
        disabledTextColor: mcol.disabledButtonText,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: mcol.disabledButtonBorder)),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            children: [
              if (leading != null)
                Icon(
                  leading,
                  color: mcol.secondary,
                  size: 20,
                ),
              if (leading != null) const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      color: mcol.disabledButtonText,
                      fontWeight: FontWeight.w500)),
              if (trailing != null) const SizedBox(width: 8),
              if (trailing != null)
                Icon(
                  trailing,
                  color: mcol.secondary,
                  size: 20,
                ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0x1018281A),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: -2),
          BoxShadow(
              color: Color(0x1018280F),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: -2)
        ]),
        child: MaterialButton(
          color: (primary != null && primary != false)
              ? Colors.orange
              : mcol.buttonBackground,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: (primary != null && primary != false)
                      ? Colors.orange.shade300
                      : mcol.buttonBorder)),
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                if (leading != null)
                  Icon(
                    leading,
                    color: (primary != null && primary != false)
                        ? Colors.orange.shade100
                        : mcol.secondary,
                    size: 20,
                  ),
                if (leading != null) const SizedBox(width: 8),
                Text(title,
                    style: TextStyle(
                        color: (primary != null && primary != false)
                            ? Colors.white
                            : (destructive ? mcol.destructive : mcol.primary),
                        fontWeight: FontWeight.w500)),
                if (trailing != null) const SizedBox(width: 8),
                if (trailing != null)
                  Icon(
                    trailing,
                    color: (primary != null && primary != false)
                        ? Colors.orange.shade100
                        : mcol.secondary,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class Badge extends StatefulWidget {
  const Badge({Key? key, required this.content, this.destructive = false})
      : super(key: key);
  final String content;
  final bool destructive;
  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
      height: 28,
      decoration: BoxDecoration(
          color: widget.destructive
              ? mcol.errorBadgeBackground
              : mcol.badgeBackground,
          borderRadius: BorderRadius.circular(100)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: widget.destructive ? mcol.destructive : Colors.orange,
                  borderRadius: BorderRadius.circular(100)),
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(right: 6, top: 2),
            ),
            Text(
              widget.content,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: widget.destructive
                      ? mcol.errorBadgeText
                      : mcol.badgeText),
            ),
          ],
        ),
      ),
    );
  }
}

class VertDivider extends StatelessWidget {
  const VertDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Divider(
        color: mcol.buttonBorder,
      ),
    );
  }
}

class _ButtonGroupState extends State<ButtonGroup> {
  var selected = 1;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0x1018281A),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: -2),
            BoxShadow(
                color: Color(0x1018280F),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: -2)
          ]),
          child: MaterialButton(
            color: (context.watch<BatchPreferences>().syllabus == 0
                ? Colors.orange
                : mcol.buttonBackground),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                side: BorderSide(
                    color: context.watch<BatchPreferences>().syllabus == 0
                        ? Colors.orange.shade300
                        : mcol.buttonBorder)),
            onPressed: () {
              setState(() {
                context.read<BatchPreferences>().setSyllabus(0);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("IGCSE",
                  style: TextStyle(
                      color: (context.watch<BatchPreferences>().syllabus == 0
                          ? Colors.white
                          : mcol.primary),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0x1018280D),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
          transform: Matrix4.translationValues(-1, 0, 0),
          child: MaterialButton(
            color: (context.watch<BatchPreferences>().syllabus == 1
                ? Colors.orange
                : mcol.buttonBackground),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                side: BorderSide(
                    color: context.watch<BatchPreferences>().syllabus == 1
                        ? Colors.orange.shade300
                        : mcol.buttonBorder)),
            onPressed: () {
              setState(() {
                context.read<BatchPreferences>().setSyllabus(1);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("A Level",
                  style: TextStyle(
                      color: (context.watch<BatchPreferences>().syllabus == 1
                          ? Colors.white
                          : mcol.primary),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSliderThumbShape extends RangeSliderThumbShape {
  const CustomSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  final double enabledThumbRadius;

  final double? disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  final double elevation;

  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    assert(sliderTheme.showValueIndicator != null);
    assert(sliderTheme.overlappingShapeStrokeColor != null);
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    final double radius = radiusTween.evaluate(enableAnimation);
    final Tween<double> elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;

    final double evaluatedElevation =
        isPressed! ? elevationTween.evaluate(activationAnimation) : elevation;
    final Path shadowPath = Path()
      ..addArc(
          Rect.fromCenter(
              center: center, width: 2 * radius, height: 2 * radius),
          0,
          math.pi * 2);
    canvas.drawShadow(shadowPath, const Color.fromARGB(40, 24, 40, 13),
        evaluatedElevation, true);

    canvas.drawCircle(
      center,
      radius,
      Paint()..color = color,
    );
  }
}

class YearRangeSlider extends StatefulWidget {
  const YearRangeSlider({Key? key}) : super(key: key);

  @override
  State<YearRangeSlider> createState() => _YearRangeSliderState();
}

class _YearRangeSliderState extends State<YearRangeSlider> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    double start = context.watch<BatchPreferences>().beginYear.toDouble();
    double end = context.watch<BatchPreferences>().endYear.toDouble();
    return SliderTheme(
        data: SliderThemeData(
            activeTrackColor: Colors.orange.shade500,
            inactiveTrackColor: mcol.sliderTrack,
            inactiveTickMarkColor: mcol.sliderTrackTickMark,
            thumbColor: mcol.sliderThumb,
            overlayColor: Colors.transparent,
            trackHeight: 6,
            valueIndicatorColor: mcol.buttonBackground,
            overlayShape: SliderComponentShape.noOverlay,
            rangeThumbShape: const CustomSliderThumbShape(
                enabledThumbRadius: 12, elevation: 4, pressedElevation: 4),
            rangeValueIndicatorShape: const CustomValueIndicatorShape(),
            valueIndicatorTextStyle:
                TextStyle(color: mcol.primary, fontWeight: FontWeight.w500)),
        child: RangeSlider(
          min: 2010,
          max: 2022,
          divisions: 12,
          labels: RangeLabels(
            start.round().toString(),
            end.round().toString(),
          ),
          values: RangeValues(start, end),
          onChanged: (values) {
            context
                .read<BatchPreferences>()
                .setYears(values.start.round(), values.end.round());
          },
        ));
  }
}

class CustomValueIndicatorShape extends RangeSliderValueIndicatorShape {
  const CustomValueIndicatorShape();

  static const _CustomSliderValueIndicatorPathPainter _pathPainter =
      _CustomSliderValueIndicatorPathPainter();

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    required TextPainter labelPainter,
    required double textScaleFactor,
  }) {
    assert(textScaleFactor >= 0);
    return _pathPainter.getPreferredSize(labelPainter, textScaleFactor);
  }

  @override
  double getHorizontalShift({
    RenderBox? parentBox,
    Offset? center,
    TextPainter? labelPainter,
    Animation<double>? activationAnimation,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    return _pathPainter.getHorizontalShift(
      parentBox: parentBox!,
      center: center!,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      scale: activationAnimation!.value,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    bool? isOnTop,
    TextPainter? labelPainter,
    double? textScaleFactor,
    Size? sizeWithOverflow,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    Thumb? thumb,
  }) {
    final Canvas canvas = context.canvas;
    final double scale = activationAnimation!.value;
    _pathPainter.paint(
      parentBox: parentBox!,
      canvas: canvas,
      center: center,
      scale: scale,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      backgroundPaintColor: sliderTheme!.valueIndicatorColor!,
      strokePaintColor: null,
    );
  }
}

class _CustomSliderValueIndicatorPathPainter {
  const _CustomSliderValueIndicatorPathPainter();

  static const double _triangleHeight = 8.0;
  static const double _labelPadding = 16.0;
  static const double _preferredHeight = 32.0;
  static const double _minLabelWidth = 16.0;
  static const double _bottomTipYOffset = 14.0;
  static const double _preferredHalfHeight = _preferredHeight / 2;
  static const double _upperRectRadius = 8;

  Size getPreferredSize(
    TextPainter labelPainter,
    double textScaleFactor,
  ) {
    return Size(
      _upperRectangleWidth(labelPainter, 1, textScaleFactor),
      labelPainter.height + _labelPadding,
    );
  }

  double getHorizontalShift({
    required RenderBox parentBox,
    required Offset center,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required double scale,
  }) {
    assert(!sizeWithOverflow.isEmpty);

    const double edgePadding = 8.0;
    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);
    final Offset globalCenter = parentBox.localToGlobal(center);
    final double overflowLeft =
        math.max(0, rectangleWidth / 2 - globalCenter.dx + edgePadding);
    final double overflowRight = math.max(
        0,
        rectangleWidth / 2 -
            (sizeWithOverflow.width - globalCenter.dx - edgePadding));

    if (rectangleWidth < sizeWithOverflow.width) {
      return overflowLeft - overflowRight;
    } else if (overflowLeft - overflowRight > 0) {
      return overflowLeft - (edgePadding * textScaleFactor);
    } else {
      return -overflowRight + (edgePadding * textScaleFactor);
    }
  }

  double _upperRectangleWidth(
      TextPainter labelPainter, double scale, double textScaleFactor) {
    final double unscaledWidth =
        math.max(_minLabelWidth * textScaleFactor, labelPainter.width) +
            _labelPadding * 2;
    return unscaledWidth * scale;
  }

  void paint({
    required RenderBox parentBox,
    required Canvas canvas,
    required Offset center,
    required double scale,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required Color backgroundPaintColor,
    Color? strokePaintColor,
  }) {
    if (scale == 0.0) {
      return;
    }
    assert(!sizeWithOverflow.isEmpty);

    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);
    final double horizontalShift = getHorizontalShift(
      parentBox: parentBox,
      center: center,
      labelPainter: labelPainter,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      scale: scale,
    );

    final double rectHeight = labelPainter.height + _labelPadding;
    final Rect upperRect = Rect.fromLTWH(
      -rectangleWidth / 2 + horizontalShift,
      -_triangleHeight - rectHeight,
      rectangleWidth,
      rectHeight,
    );

    final Path trianglePath = Path()
      ..lineTo(-_triangleHeight, -_triangleHeight)
      ..lineTo(_triangleHeight, -_triangleHeight)
      ..close();
    final Paint fillPaint = Paint()..color = backgroundPaintColor;
    final RRect upperRRect = RRect.fromRectAndRadius(
        upperRect, const Radius.circular(_upperRectRadius));
    trianglePath.addRRect(upperRRect);

    canvas.save();
    canvas.translate(center.dx, center.dy - _bottomTipYOffset);
    canvas.scale(scale, scale);
    canvas.drawShadow(
        trianglePath, const Color.fromARGB(40, 24, 40, 13), 4, true);
    if (strokePaintColor != null) {
      final Paint strokePaint = Paint()
        ..color = strokePaintColor
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawPath(trianglePath, strokePaint);
    }
    canvas.drawPath(trianglePath, fillPaint);

    final double bottomTipToUpperRectTranslateY =
        -_preferredHalfHeight / 2 - upperRect.height;
    canvas.translate(0, bottomTipToUpperRectTranslateY);
    final Offset boxCenter = Offset(horizontalShift, upperRect.height / 2);
    final Offset halfLabelPainterOffset =
        Offset(labelPainter.width / 2, labelPainter.height / 2);
    final Offset labelOffset = boxCenter - halfLabelPainterOffset;
    labelPainter.paint(canvas, labelOffset);
    canvas.restore();
  }
}

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({Key? key}) : super(key: key);

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}
